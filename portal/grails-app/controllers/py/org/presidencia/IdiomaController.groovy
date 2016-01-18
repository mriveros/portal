package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class IdiomaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Idioma.list(params), model:[idiomaInstanceCount: Idioma.count()]
    }

    def show(Idioma idiomaInstance) {
        respond idiomaInstance
    }

    def create() {
        respond new Idioma(params)
    }

    @Transactional
    def save(Idioma idiomaInstance) {
        if (idiomaInstance == null) {
            notFound()
            return
        }

        if (idiomaInstance.hasErrors()) {
            respond idiomaInstance.errors, view:'create'
            return
        }

        idiomaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'idiomaInstance.label', default: 'Idioma'), idiomaInstance.id])
                redirect idiomaInstance
            }
            '*' { respond idiomaInstance, [status: CREATED] }
        }
    }

    def edit(Idioma idiomaInstance) {
        respond idiomaInstance
    }

    @Transactional
    def update(Idioma idiomaInstance) {
        if (idiomaInstance == null) {
            notFound()
            return
        }

        if (idiomaInstance.hasErrors()) {
            respond idiomaInstance.errors, view:'edit'
            return
        }

        idiomaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Idioma.label', default: 'Idioma'), idiomaInstance.id])
                redirect idiomaInstance
            }
            '*'{ respond idiomaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Idioma idiomaInstance) {

        if (idiomaInstance == null) {
            notFound()
            return
        }

        idiomaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Idioma.label', default: 'Idioma'), idiomaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'idiomaInstance.label', default: 'Idioma'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
