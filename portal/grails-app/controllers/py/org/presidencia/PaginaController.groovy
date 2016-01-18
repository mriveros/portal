package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PaginaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def presidenciaService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pagina.list(params), model:[paginaInstanceCount: Pagina.count()]
    }

    def show(Pagina paginaInstance) {
        respond paginaInstance
    }

    def create() {
        respond new Pagina(params)
    }

    @Transactional
    def save(Pagina paginaInstance) {
        if (paginaInstance == null) {
            notFound()
            return
        }

        if (paginaInstance.hasErrors()) {
            respond paginaInstance.errors, view:'create'
            return
        }
		
        paginaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'paginaInstance.label', default: 'Pagina'), paginaInstance.id])
                redirect paginaInstance
            }
            '*' { respond paginaInstance, [status: CREATED] }
        }
    }

    def edit(Pagina paginaInstance) {
        respond paginaInstance
    }

    @Transactional
    def update(Pagina paginaInstance) {
        if (paginaInstance == null) {
            notFound()
            return
        }

        if (paginaInstance.hasErrors()) {
            respond paginaInstance.errors, view:'edit'
            return
        }
		
        paginaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pagina.label', default: 'Pagina'), paginaInstance.id])
                redirect paginaInstance
            }
            '*'{ respond paginaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pagina paginaInstance) {

        if (paginaInstance == null) {
            notFound()
            return
        }

        paginaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pagina.label', default: 'Pagina'), paginaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'paginaInstance.label', default: 'Pagina'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
