package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MenuController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
        respond Menu.findAllByNoEditable(false), model:[menuInstanceCount: Menu.count()]
    }

    def show(Menu menuInstance) {
		verificarMenu(menuInstance)
        respond menuInstance
    }

    def create() {
        respond new Menu(params)
    }

    @Transactional
    def save(Menu menuInstance) {
		
		verificarMenu(menuInstance)
		
        if (menuInstance == null) {
            notFound()
            return
        }

        if (menuInstance.hasErrors()) {
            respond menuInstance.errors, view:'create'
            return
        }

        menuInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'menuInstance.label', default: 'Menu'), menuInstance.id])
                redirect menuInstance
            }
            '*' { respond menuInstance, [status: CREATED] }
        }
    }

    def edit(Menu menuInstance) {
		
		verificarMenu(menuInstance)
		
        respond menuInstance
    }

    @Transactional
    def update(Menu menuInstance) {
		
		//verificarMenu(menuInstance)
		
        if (menuInstance == null) {
            notFound()
            return
        }

        if (menuInstance.hasErrors()) {
            respond menuInstance.errors, view:'edit'
            return
        }

        menuInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Menu.label', default: 'Menu'), menuInstance.id])
                redirect menuInstance
            }
            '*'{ respond menuInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Menu menuInstance) {
		
		verificarMenu(menuInstance)

        if (menuInstance == null) {
            notFound()
            return
        }

        menuInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Menu.label', default: 'Menu'), menuInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	protected void verificarMenu(menuInstance){
		
		if(menuInstance.noEditable){
			redirect view:'index'
		}
	}
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'menuInstance.label', default: 'Menu'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
