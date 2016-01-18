package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NoticiaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def presidenciaService
	def paginacion = new Paginacion()

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def conf = Configuracion.find("FROM Configuracion")
		def datosNoticia = presidenciaService.pagination(params,paginacion,Noticia.class)
        respond datosNoticia.lista, 
				model:[
						noticiaInstanceCount: datosNoticia.pagina.cantPag, 
					    registro:datosNoticia.pagina.pag,
						cantPaginacion: conf.cantPagina
					  ]
    }

    def show(Noticia noticiaInstance) {
        respond noticiaInstance
    }

    def create() {
        respond new Noticia(params)
    }

    @Transactional
    def save(Noticia noticiaInstance) {
				
        if (noticiaInstance == null) {
            notFound()
            return
        }

        if (noticiaInstance.hasErrors()) {
            respond noticiaInstance.errors, view:'create'
            return
        }
		if(!params?.multimedias){
			def multimedia = Multimedia.findByImagenPorDefecto(true)
			if(multimedia) noticiaInstance.addToMultimedias(multimedia)
		}
        noticiaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'noticiaInstance.label', default: 'Noticia'), noticiaInstance.id])
                redirect noticiaInstance
            }
            '*' { respond noticiaInstance, [status: CREATED] }
        }
    }

    def edit(Noticia noticiaInstance) {
        respond noticiaInstance
    }

    @Transactional
    def update(Noticia noticiaInstance) {
			
        if (noticiaInstance == null) {
            notFound()
            return
        }

        if (noticiaInstance.hasErrors()) {
            respond noticiaInstance.errors, view:'edit'
            return
        }
		
		if(!params?.multimedias){
			def multimedia = Multimedia.findByImagenPorDefecto(true)
			if(multimedia) noticiaInstance.addToMultimedias(multimedia)
		}

        noticiaInstance.save flush:true, insert:false

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Noticia.label', default: 'Noticia'), noticiaInstance.id])
                redirect noticiaInstance
            }
            '*'{ respond noticiaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Noticia noticiaInstance) {

        if (noticiaInstance == null) {
            notFound()
            return
        }

        noticiaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Noticia.label', default: 'Noticia'), noticiaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	def ajaxGetLista(Integer max, Integer pagina){
		
		params.max = Math.min(max ?: 10, 100)
		def datosNoticia = presidenciaService.pagination(params,paginacion,Noticia.class)
		
		render template:"table", model:["noticiaInstanceCount": datosNoticia.pagina.pag,
										"noticiaInstanceList":datosNoticia.lista]
	}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'noticiaInstance.label', default: 'Noticia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
