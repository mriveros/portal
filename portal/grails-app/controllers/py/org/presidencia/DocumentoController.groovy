package py.org.presidencia



import static org.springframework.http.HttpStatus.*

import java.nio.Buffer;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Documento.list(params), model:[documentoInstanceCount: Documento.count()]
	}

	def show(Documento documentoInstance) {
		respond documentoInstance
	}

	def create() {
		
		if(flash?.parametros){
			respond new Documento(flash.parametros)
		}else{
			respond new Documento(params)
		}
	}

	@Transactional
	def save(Documento documentoInstance) {


		if (documentoInstance == null) {
			notFound()
			return
		}

		documentoInstance.validate()
		
		if (documentoInstance.hasErrors()) {
			respond documentoInstance.errors, view:'create'
			return
		}
		
		CommonsMultipartFile uploadFile = params.adjunto
		def contentType = uploadFile.contentType
		def fileName = uploadFile.originalFilename
		def fileOut = new FileOutputStream("/tmp/$fileName")
		def bufferFile = new BufferedOutputStream(fileOut)
		def md5
		def resumen
		
		if(documentoInstance.adjunto.size() > 0){
			
			bufferFile.write(documentoInstance.adjunto,0,documentoInstance.adjunto.size())
			def command = "md5sum /tmp/$fileName"
			def returnCommand = Runtime.getRuntime().exec(command)
			def inputStream = returnCommand.getInputStream()
			def bufferReader = new BufferedReader(new InputStreamReader(inputStream))
			md5 = bufferReader.readLine()
			def lista = md5.split(" ")
			bufferFile.close()
			resumen = lista[0]
			
		}

		if (documentoInstance.adjunto.size() > PresidenciaService.MAX_SIZE ) {
			String nombre = "${documentoInstance.tipo.descripcion}-${documentoInstance.numero}.pdf"
			documentoInstance.adjunto = PresidenciaService.comprimir(documentoInstance.adjunto,nombre);
			documentoInstance.zip = true

		}
		
		if(resumen != params.resumen){
			flash.parametros = params
			flash.message = "El Archivo no se cargo adecuadamente"
			redirect action: "create", method: "GET"
			return
		}


		documentoInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'documentoInstance.label', default: 'Documento'),
					documentoInstance.id
				])
				redirect documentoInstance
			}
			'*' { respond documentoInstance, [status: CREATED] }
		}
	}

	def edit(Documento documentoInstance) {
		respond documentoInstance
	}

	@Transactional
	def update(Documento documentoInstance) {
		if (documentoInstance == null) {
			notFound()
			return
		}
		
		documentoInstance.validate()
		
		if (documentoInstance.hasErrors()) {
			respond documentoInstance.errors, view:'edit'
			return
		}

		CommonsMultipartFile uploadFile = params.adjunto
		def contentType = uploadFile.contentType
		def fileName = uploadFile.originalFilename
		def fileOut = new FileOutputStream("/tmp/$fileName")
		def bufferFile = new BufferedOutputStream(fileOut)
		def md5
		def resumen
		
		if(documentoInstance.adjunto.size() > 0){
			
			bufferFile.write(documentoInstance.adjunto,0,documentoInstance.adjunto.size())
			def command = "md5sum /tmp/$fileName"
			def returnCommand = Runtime.getRuntime().exec(command)
			def inputStream = returnCommand.getInputStream()
			def bufferReader = new BufferedReader(new InputStreamReader(inputStream))
			md5 = bufferReader.readLine()
			def lista = md5.split(" ")
			bufferFile.close()
			resumen = lista[0]
			
		}

		if (documentoInstance.adjunto.size() > PresidenciaService.MAX_SIZE ) {
			String nombre = "${documentoInstance.tipo.descripcion}-${documentoInstance.numero}.pdf"
			documentoInstance.adjunto = PresidenciaService.comprimir(documentoInstance.adjunto,nombre);
			documentoInstance.zip = true

		}
		
		if(resumen != params.resumen){
			flash.parametros = params
			flash.message = "El Archivo no se cargo adecuadamente"
			redirect action: "create", method: "GET"
			return
		}

		documentoInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Documento.label', default: 'Documento'),
					documentoInstance.id
				])
				redirect documentoInstance
			}
			'*'{ respond documentoInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Documento documentoInstance) {

		if (documentoInstance == null) {
			notFound()
			return
		}

		documentoInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Documento.label', default: 'Documento'),
					documentoInstance.id
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
					message(code: 'documentoInstance.label', default: 'Documento'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}

