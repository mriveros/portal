package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MultimediaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
        respond Multimedia.list(params), model:[multimediaInstanceCount: Multimedia.count()]
    }

    def show(Multimedia multimediaInstance) {
        respond multimediaInstance
    }

    def create() {
        respond new Multimedia(params)
    }

    @Transactional
    def save(Multimedia multimediaInstance) {
        if (multimediaInstance == null) {
            notFound()
            return
        }

        if (multimediaInstance.hasErrors()) {
            respond multimediaInstance.errors, view:'create'
            return
        }

        multimediaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'multimediaInstance.label', default: 'Multimedia'), multimediaInstance.id])
                redirect multimediaInstance
            }
            '*' { respond multimediaInstance, [status: CREATED] }
        }
    }

    def edit(Multimedia multimediaInstance) {
        respond multimediaInstance
    }

    @Transactional
    def update(Multimedia multimediaInstance) {
        if (multimediaInstance == null) {
            notFound()
            return
        }

        if (multimediaInstance.hasErrors()) {
            respond multimediaInstance.errors, view:'edit'
            return
        }

        multimediaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Multimedia.label', default: 'Multimedia'), multimediaInstance.id])
                redirect multimediaInstance
            }
            '*'{ respond multimediaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Multimedia multimediaInstance) {

        if (multimediaInstance == null) {
            notFound()
            return
        }

        multimediaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Multimedia.label', default: 'Multimedia'), multimediaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'multimediaInstance.label', default: 'Multimedia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
