package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioPerfilController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UsuarioPerfil.list(params), model:[usuarioPerfilInstanceCount: UsuarioPerfil.count()]
    }

    def show(UsuarioPerfil usuarioPerfilInstance) {
        respond usuarioPerfilInstance
    }

    def create() {
        respond new UsuarioPerfil(params)
    }

    @Transactional
    def save(UsuarioPerfil usuarioPerfilInstance) {
        if (usuarioPerfilInstance == null) {
            notFound()
            return
        }

        if (usuarioPerfilInstance.hasErrors()) {
            respond usuarioPerfilInstance.errors, view:'create'
            return
        }

        usuarioPerfilInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioPerfilInstance.label', default: 'UsuarioPerfil'), usuarioPerfilInstance.id])
                redirect usuarioPerfilInstance
            }
            '*' { respond usuarioPerfilInstance, [status: CREATED] }
        }
    }

    def edit(UsuarioPerfil usuarioPerfilInstance) {
        respond usuarioPerfilInstance
    }

    @Transactional
    def update(UsuarioPerfil usuarioPerfilInstance) {
        if (usuarioPerfilInstance == null) {
            notFound()
            return
        }

        if (usuarioPerfilInstance.hasErrors()) {
            respond usuarioPerfilInstance.errors, view:'edit'
            return
        }

        usuarioPerfilInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UsuarioPerfil.label', default: 'UsuarioPerfil'), usuarioPerfilInstance.id])
                redirect usuarioPerfilInstance
            }
            '*'{ respond usuarioPerfilInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UsuarioPerfil usuarioPerfilInstance) {

        if (usuarioPerfilInstance == null) {
            notFound()
            return
        }

        usuarioPerfilInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UsuarioPerfil.label', default: 'UsuarioPerfil'), usuarioPerfilInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioPerfilInstance.label', default: 'UsuarioPerfil'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
