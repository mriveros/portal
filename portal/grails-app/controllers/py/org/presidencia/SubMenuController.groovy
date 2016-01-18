package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubMenuController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SubMenu.list(params), model:[subMenuInstanceCount: SubMenu.count()]
    }

    def show(SubMenu subMenuInstance) {
        respond subMenuInstance
    }

    def create() {
        respond new SubMenu(params)
    }

    @Transactional
    def save(SubMenu subMenuInstance) {
        if (subMenuInstance == null) {
            notFound()
            return
        }

        if (subMenuInstance.hasErrors()) {
            respond subMenuInstance.errors, view:'create'
            return
        }
		
		if(subMenuInstance.tipo == "3")
		{
			subMenuInstance.link=""
			subMenuInstance.entidad=""
		}

        subMenuInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subMenuInstance.label', default: 'SubMenu'), subMenuInstance.id])
                redirect subMenuInstance
            }
            '*' { respond subMenuInstance, [status: CREATED] }
        }
    }

    def edit(SubMenu subMenuInstance) {
        respond subMenuInstance
    }

    @Transactional
    def update(SubMenu subMenuInstance) {
        if (subMenuInstance == null) {
            notFound()
            return
        }

        if (subMenuInstance.hasErrors()) {
            respond subMenuInstance.errors, view:'edit'
            return
        }
		if(subMenuInstance.tipo == "3")
		{
			subMenuInstance.link=""
			subMenuInstance.entidad=""
		}
        subMenuInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SubMenu.label', default: 'SubMenu'), subMenuInstance.id])
                redirect subMenuInstance
            }
            '*'{ respond subMenuInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SubMenu subMenuInstance) {

        if (subMenuInstance == null) {
            notFound()
            return
        }

        subMenuInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SubMenu.label', default: 'SubMenu'), subMenuInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subMenuInstance.label', default: 'SubMenu'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

