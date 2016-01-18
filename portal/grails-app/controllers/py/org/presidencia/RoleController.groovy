package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RoleController {

	def springSecurityService
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Role.list(params), model:[roleInstanceCount: Role.count()]
	}

	def show(Role roleInstance) {
		def permisosExistentes = Requestmap.findAll("FROM Requestmap WHERE configAttribute like '%${roleInstance.authority}%'")
		[roleInstance:roleInstance, permisosExistentes: permisosExistentes]
	}

	def create() {
		respond new Role(params)
	}

	@Transactional
	def save() {

		Role roleInstance = new Role()
		def nombre = "ROLE_";
		def nombreRol = params.name.replaceAll(" ","_");
		roleInstance.authority = "${nombre}${nombreRol}"
		roleInstance.name = params.name
		println "role: ${roleInstance.authority}"
		if (roleInstance.hasErrors()) {
			respond roleInstance.errors, view:'create'
			return
		}
		roleInstance.save flush:true, failOnError:true
		def parmPermiso = params.list("permisos")

		if(parmPermiso.size() == 1){
			def requestmapInstance = Requestmap.findByUrl(parmPermiso)

			if (requestmapInstance) {
				def permisos = requestmapInstance.configAttribute

				permisos = permisos + "," + roleInstance.authority
				requestmapInstance.configAttribute=permisos
				requestmapInstance.save(flush:true, failOnError:true)
				springSecurityService.clearCachedRequestmaps()
			}
			else {
				requestmapInstance = new Requestmap()
				requestmapInstance.url=parmPermiso
				requestmapInstance.configAttribute=roleInstance.authority
				requestmapInstance.save(flush: true , failOnError:true)

				springSecurityService.clearCachedRequestmaps()
			}
		}else
			for (urlPerm in parmPermiso){

				def requestmapInstance = Requestmap.findByUrl(urlPerm)
				if (requestmapInstance) {
					def permisos = requestmapInstance.configAttribute

					permisos = permisos + "," + roleInstance.authority
					requestmapInstance.configAttribute=permisos
					requestmapInstance.save(flush:true , failOnError:true)
					springSecurityService.clearCachedRequestmaps()
				}
				else {
					requestmapInstance = new Requestmap()
					requestmapInstance.url=urlPerm
					requestmapInstance.configAttribute=roleInstance.authority
					requestmapInstance.save(flush: true , failOnError:true)

					springSecurityService.clearCachedRequestmaps()
				}
			}

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'roleInstance.label', default: 'Role'),
					roleInstance.id
				])
				redirect roleInstance
			}
			'*' { respond roleInstance, [status: CREATED] }
		}
	}

	def edit(Role roleInstance) {
		respond roleInstance
	}

	@Transactional
	def update(Role roleInstance) {
		if (roleInstance == null) {
			notFound()
			return
		}

		if (roleInstance.hasErrors()) {
			respond roleInstance.errors, view:'edit'
			return
		}

		roleInstance.save flush:true


		def permisosNuevos = []
		def permisosExistentes = []
		permisosExistentes = Requestmap.findAll("FROM Requestmap WHERE configAttribute like '%${roleInstance.authority}%'")
		permisosNuevos = params.list("permisos")

		//println "**** permisosExistentes: "+permisosExistentes
		//println "---- permisosNuevos: "+permisosNuevos

		//si selecciono solo un permiso
		if(permisosNuevos.size() == 1)
		{

			def requestmapInstance = Requestmap.find("FROM Requestmap WHERE configAttribute like '%${roleInstance.authority}%' AND url='${permisosNuevos}'")

			//println "----YA EXISTE PARA EL ROL requestmapInstance: "+requestmapInstance

			//si el permiso ya existe para ese rol
			if (requestmapInstance)
			{
				//				permisosNuevos = Requestmap.findByUrl(permisosNuevos)
				//				permisosExistentes.remove(permisosNuevos)
			}
			else
			{
				//si no existe para ese rol se verifica que exista o no en base de datos
				//def permisoExiste = Requestmap.findAllByUrl(permisosNuevos)
				def permisoExiste = Requestmap.findByUrl(permisosNuevos)

				//println "PERMISO EXISTE??? "+permisoExiste
				//si existe en bd se actualizan sus configAttribute, se le agrega el rol actual
				if(permisoExiste)
				{
					//println "SI EXISTE: "+permisoExiste
					def pp = permisoExiste.configAttribute
					pp = pp + "," + roleInstance.authority
					permisoExiste.configAttribute=pp
					permisoExiste.save(flush:true)
					springSecurityService.clearCachedRequestmaps()
				}
				//si el permiso aun no existe se crea uno nuevo
				else
				{

					//println "CREAR NUEVO"
					def permisoNuevo = new Requestmap()
					permisoNuevo.url=permisosNuevos
					if(roleInstance.authority!='ROLE_ADMIN'){
						requestmapInstance.configAttribute=roleInstance.authority + ',ROLE_ADMIN'
					}else{
						requestmapInstance.configAttribute=roleInstance.authority
						permisoNuevo.save(flush: true)
					}

					springSecurityService.clearCachedRequestmaps()


					//println "permiso Nuevo-------> "+permisoNuevo.url

				}


			}
			//si selecciono una lista de permisos
		}else{
			for (urlPerm in permisosNuevos){

				//println "urlPerm: "+urlPerm

				def existe = Requestmap.find("FROM Requestmap WHERE configAttribute like '%${roleInstance.authority}%' AND url='${urlPerm}'")
				if (existe){

					//println "EXISTE: "+existe
					//permisosExistentes.remove(existe)
				}else{

					//println "NO EXISTE"

					def requestmapInstance = Requestmap.findByUrl(urlPerm)

					if (requestmapInstance){

						//println "REQUEST ID: "+requestmapInstance.id

						def permisos = requestmapInstance.configAttribute

						permisos = permisos + "," + roleInstance.authority
						requestmapInstance.configAttribute=permisos

						requestmapInstance.save(flush:true,failOnError:true)
						springSecurityService.clearCachedRequestmaps()

					}else{

						//println "*******   CREAR NUEVO REQUESMAP   *******"
						requestmapInstance = new Requestmap()
						requestmapInstance.url=urlPerm
						if(roleInstance.authority!='ROLE_ADMIN')
							requestmapInstance.configAttribute=roleInstance.authority + ',ROLE_ADMIN'
						else
							requestmapInstance.configAttribute=roleInstance.authority

						requestmapInstance.save(flush: true)

						springSecurityService.clearCachedRequestmaps()

					}
				}

			}
		}
		//		for(permiso in permisosExistentes) {
		//
		//
		//			def listaRoles = permiso.configAttribute.split(",")
		//			if (listaRoles.size()==1)
		//			{
		//				permiso.delete(flush:true)
		//				springSecurityService.clearCachedRequestmaps()
		//			}
		//			else
		//			{
		//				def nuevosRoles =""
		//				for (listaR in listaRoles)
		//				{
		//					if (listaR!=roleInstance.authority)
		//					{
		//						nuevosRoles = nuevosRoles + listaR + ","
		//					}
		//				}
		//				nuevosRoles = nuevosRoles.substring(0,nuevosRoles.length()-1)
		//				permiso.configAttribute = nuevosRoles
		//				permiso.save flush:true
		//				springSecurityService.clearCachedRequestmaps()
		//			}
		//		}

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Role.label', default: 'Role'),
					roleInstance.id
				])
				redirect roleInstance
			}
			'*'{ respond roleInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Role roleInstance) {

		if (roleInstance == null) {
			notFound()
			return
		}

		roleInstance.delete flush:true

		def permisosExistentes = Requestmap.findAll("FROM Requestmap WHERE configAttribute like '%${roleInstance.authority}%'")
		for(permiso in permisosExistentes) {


			def listaRoles = permiso.configAttribute.split(",")
			if (listaRoles.size()==1)
			{
				permiso.delete(flush:true)
				springSecurityService.clearCachedRequestmaps()
			}
			else
			{
				def nuevosRoles =""
				for (listaR in listaRoles)
				{
					if (listaR!=roleInstance.authority)
					{
						nuevosRoles = nuevosRoles + listaR + ","
					}
				}
				nuevosRoles = nuevosRoles.substring(0,nuevosRoles.length()-1)
				permiso.configAttribute = nuevosRoles
				permiso.save flush:true
				springSecurityService.clearCachedRequestmaps()
			}
		}

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Role.label', default: 'Role'),
					roleInstance.id
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
					message(code: 'roleInstance.label', default: 'Role'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
