package py.org.presidencia



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AgendaController {
	//----------------------------------------------------------------------------------
	def paginacion = new Paginacion()
	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def conf = Configuracion.find("FROM Configuracion")
		def datosAgenda = presidenciaService.pagination(params,paginacion,Agenda.class)
		respond datosAgenda.lista,
				model:[
						noticiaInstanceCount: datosAgenda.pagina.cantPag,
						registro:datosAgenda.pagina.pag,
						cantPaginacion: conf.cantPagina
					  ]
	}
	def show(Agenda agendaInstance) {
		respond agendaInstance
	}
	def ajaxGetLista(Integer max, Integer pagina){
		
		params.max = Math.min(max ?: 10, 100)
		def datosAgenda = presidenciaService.pagination(params,paginacion,Agenda.class)
		
		render template:"table", model:["agendaInstanceCount": datosAgenda.pagina.pag,
										"agendaInstanceList":datosAgenda.lista]
	}
	//----------------------------------------------------------------------------------
    static scaffold = true


	public static java.lang.Object getScaffold() {
		return scaffold;
	}

	public static void setScaffold(java.lang.Object scaffold) {
		AgendaController.scaffold = scaffold;
	}}