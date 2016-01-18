package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class ContactoController {

	def mailService
	def simpleCaptchaService
	def dataSource
	def springSecurityService

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		
		respond Contacto.list(params), model:[contactoInstanceCount: Contacto.count()]
	}

	def show(Contacto contactoInstance) {
		respond contactoInstance
	}

	def create() {
		respond new Contacto(params)
	}

	@Transactional
	def save(Contacto contactoInstance) {
		if (contactoInstance == null) {
			notFound()
			return
		}

		if (contactoInstance.hasErrors()) {
			respond contactoInstance.errors, view:'create'
			return
		}

		contactoInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'contactoInstance.label', default: 'Contacto'),
					contactoInstance.id
				])
				redirect contactoInstance
			}
			'*' { respond contactoInstance, [status: CREATED] }
		}
	}

	def edit(Contacto contactoInstance) {
		respond contactoInstance
	}

	@Transactional
	def update(Contacto contactoInstance) {
		if (contactoInstance == null) {
			notFound()
			return
		}

		if (contactoInstance.hasErrors()) {
			respond contactoInstance.errors, view:'edit'
			return
		}

		contactoInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Contacto.label', default: 'Contacto'),
					contactoInstance.id
				])
				redirect contactoInstance
			}
			'*'{ respond contactoInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Contacto contactoInstance) {

		if (contactoInstance == null) {
			notFound()
			return
		}

		contactoInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Contacto.label', default: 'Contacto'),
					contactoInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	def contacto(){

		def listaMenu = Menu.findAllByActivo(true,[sort:"id"])
		render view:"contacto", model:[menus:listaMenu]
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'contactoInstance.label', default: 'Contacto'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def sendMail(Correo correoInstance){

		boolean captchaValid = simpleCaptchaService.validateCaptcha(params?.captcha)

		if(!captchaValid){

			flash.error = "Vuelva a introducir el Captcha"
			flash.mensaje = params?.mensaje
			flash.asunto = params?.asunto
			flash.email = params?.email
			flash.nrotelefonico = params?.nrotelefonico
			flash.ci = params?.ci
			flash.apellido = params.apellido
			flash.nombre = params.nombre


			redirect action: "contacto"
		}else{

			correoInstance.ip = request.getRemoteAddr()
			correoInstance.fecha = new Date()

			if (correoInstance.hasErrors()) {

				flash.mensaje = params?.mensaje
				flash.asunto = params?.asunto
				flash.email = params?.email
				flash.nrotelefonico = params?.nrotelefonico
				flash.ci = params?.ci
				flash.apellido = params.apellidoet
				flash.nombre = params.nombre
						
				respond correoInstance.errors, action:'contacto' , view:'contacto'
			}else{

				def contacto = Contacto.find("FROM Contacto")
				def conf = Configuracion.find("FROM Configuracion")
				def envio = GestionMail.sendMail(params,contacto,conf)
				
								
				if(envio){
					flash.message = "Correo enviado correctamente!!!"
				}else{
					flash.mensaje = params?.mensaje
					flash.asunto = params?.asunto
					flash.email = params?.email
					flash.nrotelefonico = params?.nrotelefonico
					flash.ci = params?.ci
					flash.apellido = params.apellido
					flash.nombre = params.nombre
					flash.error = "Hubo un error al enviar el correo"
				}
				
				correoInstance.save()
				redirect action: "contacto"
			}
		}
	}
	@Transactional
	def getPersona(){
		def sql = new Sql(dataSource)
		def persona = sql.rows("select * from persona p where p.documento_identidad = ? ",params?.nro)

		render(contentType:'application/json'){
			data(nombre:persona.nombre, apellido:persona.apellido)
		}
	}
}
