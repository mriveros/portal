package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import groovy.sql.Sql

import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def dataSource

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond User.list(params), model:[userInstanceCount: User.count()]
	}

	def show(User userInstance) {
		respond userInstance
	}

	def create() {
		flash.pass = true
		respond new User(params)
	}

	@Transactional
	def save(User userInstance) {

		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'create'
			return
		}

		userInstance.save(flush:true)

		def roles = params.list("roles")

		/*
		 * Averiguamos si el retorno es una lista de elementos o solo se envio un dato
		 */

		if(roles.size() == 1) {

			def Rol = Role.get(roles[0])
			def sql = new Sql(dataSource)
			def userRole = sql.execute("INSERT INTO user_role(user_id, role_id) VALUES (?, ?)",userInstance.id,Rol.id)

			//UserRole.create userInstance, Rol,true

		}else{
			for (idRol in roles){

				def Rol = Role.get(idRol)
				def sql = new Sql(dataSource)

				def userRole = sql.execute("INSERT INTO user_role(user_id, role_id) VALUES (?, ?)",userInstance.id,Rol.id)
				//UserRole.create userInstance, Rol,true

			}
		}



		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'userInstance.label', default: 'User'),
					userInstance.id
				])
				redirect userInstance
			}
			'*' { respond userInstance, [status: CREATED] }
		}
	}

	def edit(User userInstance) {
		flash.pass = false
		respond userInstance
	}

	@Transactional
	def update(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}

		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'edit'
			return
		}

		userInstance.save flush:true

		def rolesNuevos = []
		def rolesExistentes = []
		rolesExistentes = userInstance.authorities
		rolesNuevos = params.list("roles")

		if(rolesNuevos.size() == 1) {

			def rol = Role.findById(rolesNuevos[0].toInteger())

			if (!(rol in rolesExistentes)) {
				UserRole.create userInstance, Role.get(rol.id)
			}else {
				rolesExistentes.remove(rol)
			}
		}else{

			for (nuevoRol in rolesNuevos) {

				def rol = Role.get(nuevoRol)

				if (!(rol in rolesExistentes)) {

					def usuarioRol = new UserRole()
					usuarioRol.user = userInstance
					usuarioRol.role = rol
					usuarioRol.save()
					//println "usuarioRol: "+usuarioRol
				}else {

					//println "rol YA existe, eliminar: "+rol

					rolesExistentes.remove(rol)

				}
			}
		}
		
		for(rol in rolesExistentes) {
			def eliminar = UserRole.findByUserAndRole(userInstance, rol)
			eliminar.delete()
		}
		
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'User.label', default: 'User'),
					userInstance.id
				])
				redirect userInstance
			}
			'*'{ respond userInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(User userInstance) {

		if (userInstance == null) {
			notFound()
			return
		}

		if(userInstance.getAuthorities().size() >= 1 ){
			def roles = userInstance.getAuthorities()
			for(int i=0 ;i< roles.size();i++){

				UserRole.remove userInstance, roles[i]
			}
		}

		userInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'User.label', default: 'User'),
					userInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'userInstance.label', default: 'User'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
