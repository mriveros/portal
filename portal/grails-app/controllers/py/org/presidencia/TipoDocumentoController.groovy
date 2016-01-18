package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoDocumentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoDocumento.list(params), model:[tipoDocumentoInstanceCount: TipoDocumento.count()]
    }

    def show(TipoDocumento tipoDocumentoInstance) {
        respond tipoDocumentoInstance
    }

    def create() {
        respond new TipoDocumento(params)
    }

    @Transactional
    def save(TipoDocumento tipoDocumentoInstance) {
        if (tipoDocumentoInstance == null) {
            notFound()
            return
        }

        if (tipoDocumentoInstance.hasErrors()) {
            respond tipoDocumentoInstance.errors, view:'create'
            return
        }

        tipoDocumentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoDocumentoInstance.label', default: 'TipoDocumento'), tipoDocumentoInstance.id])
                redirect tipoDocumentoInstance
            }
            '*' { respond tipoDocumentoInstance, [status: CREATED] }
        }
    }

    def edit(TipoDocumento tipoDocumentoInstance) {
        respond tipoDocumentoInstance
    }

    @Transactional
    def update(TipoDocumento tipoDocumentoInstance) {
        if (tipoDocumentoInstance == null) {
            notFound()
            return
        }

        if (tipoDocumentoInstance.hasErrors()) {
            respond tipoDocumentoInstance.errors, view:'edit'
            return
        }

        tipoDocumentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoDocumento.label', default: 'TipoDocumento'), tipoDocumentoInstance.id])
                redirect tipoDocumentoInstance
            }
            '*'{ respond tipoDocumentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoDocumento tipoDocumentoInstance) {

        if (tipoDocumentoInstance == null) {
            notFound()
            return
        }

        tipoDocumentoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoDocumento.label', default: 'TipoDocumento'), tipoDocumentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoDocumentoInstance.label', default: 'TipoDocumento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
