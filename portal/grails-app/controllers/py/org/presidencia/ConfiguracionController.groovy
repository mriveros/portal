package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfiguracionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Configuracion.list(params), model:[configuracionInstanceCount: Configuracion.count()]
    }

    def show(Configuracion configuracionInstance) {
        respond configuracionInstance
    }

    def create() {
		flash.create = true
    }

    @Transactional
    def save(Configuracion configuracionInstance) {
        if (configuracionInstance == null) {
            notFound()
            return
        }

        if (configuracionInstance.hasErrors()) {
            respond configuracionInstance.errors, view:'create'
            return
        }

        configuracionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'configuracionInstance.label', default: 'Configuracion'), configuracionInstance.id])
                redirect configuracionInstance
            }
            '*' { respond configuracionInstance, [status: CREATED] }
        }
    }

    def edit(Configuracion configuracionInstance) {
        respond configuracionInstance
    }

    @Transactional
    def update(Configuracion configuracionInstance) {
        if (configuracionInstance == null) {
            notFound()
            return
        }

        if (configuracionInstance.hasErrors()) {
            respond configuracionInstance.errors, view:'edit'
            return
        }

        configuracionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Configuracion.label', default: 'Configuracion'), configuracionInstance.id])
                redirect configuracionInstance
            }
            '*'{ respond configuracionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Configuracion configuracionInstance) {

        if (configuracionInstance == null) {
            notFound()
            return
        }

        configuracionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Configuracion.label', default: 'Configuracion'), configuracionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionInstance.label', default: 'Configuracion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
