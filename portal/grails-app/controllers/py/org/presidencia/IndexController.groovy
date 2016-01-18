package py.org.presidencia

import java.lang.invoke.SwitchPoint;

import javax.swing.text.View;

import grails.converters.JSON
import grails.gsp.PageRenderer

import org.apache.commons.codec.binary.Base64

import com.sun.java.util.jar.pack.Instruction.Switch;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.ContentType;

class IndexController {
	def meses = [
		'',
		'Ene',
		'Feb',
		'Mar',
		'Abr',
		'May',
		'Jun',
		'Jul',
		'Ago',
		'Set',
		'Oct',
		'Nov',
		'Dic'
	]
	PageRenderer groovyPageRenderer;

	//Metodo que es invocado al llamar a la pagina principal
	def index(){

		def calendarios = []
		def detalles = []
		def listaNoticias = []
		def noticias = []
		def listaSlide = []
		def sliderNoticias


		
		def now = new Date();
		def conf = Configuracion.find("FROM Configuracion")
		calendarios = getFechaCalendario(calendarios, now)
		listaNoticias = Noticia.findAll("FROM Noticia n WHERE n.destacado = true order by n.permanente desc",[max:conf.cantNoticiaPag])
		listaNoticias.sort{ it.slider == true }
		
		
		sliderNoticias = Noticia.findAllBySlider(true,[sort:'id'])
		sliderNoticias.each{ nt ->
			NoticiaWrapped noticia = new NoticiaWrapped()
			noticia.id = nt.id
			noticia.titulo = nt.titulo
			noticia.subTitulo = nt.subTitulo
			noticia.descripcion = nt.descripcion
			noticia.fecha = nt.fecha.format("dd/MM/yyyy")
			noticia.imagen = getImg(nt.multimedias[0].contenido)
			listaSlide << noticia
		}

		listaNoticias.each { nt ->
			NoticiaWrapped noticia = new NoticiaWrapped()
			noticia.id = nt.id
			noticia.titulo = nt.titulo
			noticia.subTitulo = nt.subTitulo
			noticia.descripcion = nt.descripcion
			noticia.fecha = nt.fecha.format("dd/MM/yyyy")
			noticia.imagen = getImg(nt.multimedias[0].contenido)
			noticias << noticia
		}
		def auxDate = now.format("yyyy/MM/dd")
		def listaServicios = Servicio.findAll();
		detalles = Agenda.findAll("FROM Agenda order by fecha desc",[max:conf.cantAgendaPag])
		calendarios.sort{it.fvalue}.reverse()

		//def listaNoticia = lCal.groupBy({it.fecha})
		def idioma = Idioma.findByCodigo('es')
		//def listaMenu = Menu.findAllByActivoAndTituloNotEqualAndIdiomaEqual(true,'Transparencia',idioma)
		def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id")

		def contacto = Contacto.findByActivo(true)

		[	"agenda": calendarios,
			"cantidadNoticia":Noticia.count(),
			"pgNoticia":conf.cantNoticiaPag ,
			"cantidadAgenda":Agenda.count(),
			"pgAgenda":conf.cantAgendaPag ,
			"detalle":detalles,
			"menus":listaMenu,
			"noticias":noticias,
			"servicios":listaServicios,
			"contacto":contacto,
			"slide":listaSlide
		]
	}

	
	//Retorna detalles de la Agenda Solicitada
	def getDetalle = {

		def conf = Configuracion.find("from Configuracion")
		def listas = Agenda.findAllByFecha(Date.parse("yyyy/MM/dd",params.fecha),[max:conf.cantAgendaPag])
		def detalles = []
		def calendarios = []
		calendarios = getFechaCalendario(calendarios,new Date(params.fecha))

		if(listas){

			listas.each{ lista ->

				CalendarWrapped calendario = new CalendarWrapped()
				String z = (lista.fecha.format("dd") as int) +" "+ meses[(lista.fecha.format("MM") as int)]
				calendario.setFecha(z)
				calendario.setFvalue(lista.fecha.format("yyyy/MM/dd"))
				calendario.setTitulo(lista.titulo)
				calendario.setSubTitulo(lista.subTitulo)
				calendario.setDate(new Date(lista.hora.format("dd/MM/yyyy")))
				calendario.setId(lista.id)

				detalles << calendario
			}
		}

		calendarios.sort{it.fvalue}.reverse()

		//			println detalles

		render (view:"_detalle" ,model:["detalle":detalles,"agenda":calendarios,"fecha":params.fecha])

	}
	//Crea un lista de fechas desde la fecha enviada como parametro
	private getFechaCalendario(lCal, now){

		def fecha =  now
		for(int i=1;i<=4;i++){
			CalendarWrapped calendario = new CalendarWrapped()
			String z = ((fecha - i).format("dd") as int) +" "+ meses[((fecha - i).format("MM") as int)]
			calendario.setFecha(z)
			calendario.setFvalue((fecha - i).format("yyyy/MM/dd"))
			calendario.setFechaAgenda(now.format("yyyy/MM/dd"))
			lCal << calendario
		}

		CalendarWrapped calendario = new CalendarWrapped()
		String z = (now.format("dd") as int) +" "+ meses[(now.format("MM") as int)]
		calendario.setFecha(z)
		calendario.setFvalue(now.format("yyyy/MM/dd"))
		calendario.setFechaAgenda(now.format("yyyy/MM/dd"))
		lCal << calendario

		fecha =  now
		for(int i=1;i<=4;i++){
			calendario = new CalendarWrapped()
			z = ((fecha + i).format("dd") as int) +" "+ meses[((fecha + i).format("MM") as int)]
			calendario.setFecha(z)
			calendario.setFvalue((fecha + i).format("yyyy/MM/dd"))
			calendario.setFechaAgenda(now.format("yyyy/MM/dd"))
			lCal << calendario
		}
		return lCal
	}

	String getImg(contenido){
		byte[] encodeBase64 = Base64.encodeBase64(contenido);
		String base64DataString = new String(encodeBase64 , "UTF-8");
		String data = "data:image/jpeg;base64,${base64DataString}"
		return data
	}

	def ajaxGetNoticias = {

		def noticias = []
		def conf = Configuracion.findAll("from Configuracion");

		int limit = params?.max != 0 ? params.max.toInteger() : conf.cantNoticiaPag
		int reg = params?.offset != 0 ? params.offset.toInteger() : 0

		def listaNoticias = Noticia.findAllByDestacado(true,[max:params.max,offset:params.offset])

		listaNoticias.each { nt ->
			NoticiaWrapped noticia = new NoticiaWrapped()
			noticia.id = nt.id
			noticia.titulo = nt.titulo
			noticia.subTitulo = nt.subTitulo
			noticia.descripcion = nt.descripcion
			noticia.fecha = nt.fecha.format("dd/MM/yyyy")
			noticia.imagen = getImg(nt.multimedias[0].contenido)
			noticias << noticia
		}
		
		

		render (template:"noticia", model:["cantidadNoticia":Noticia.count(),"noticias":noticias])
	}

	def ajaxGetAgendas = {
		
				def agendas = []
				def conf = Configuracion.findAll("from Configuracion");
		
				int limit = params?.max2 != 0 ? params.max2.toInteger() : conf.cantAgendaPag
				int reg = params?.offset2 != 0 ? params.offset2.toInteger() : 0
				// Este es el que funciona
				//def listaAgendas = Agenda.findAll("From Agenda order by fecha desc",[max:params.max2,offset:params.offset2])
				def listaAgendas = Agenda.findAll("From Agenda order by fecha desc",[max:limit,offset:reg])
				//def listaAgendas = Agenda.findAllByActivo(true,[max:10,offset:6])
				def listaAgendasOrden =Agenda.findAll("FROM Agenda order by fecha desc")
				
				listaAgendas.each { ag ->
					AgendaWrapped agenda = new AgendaWrapped()
					agenda.id = ag.id
					agenda.titulo = ag.titulo
					agenda.subTitulo = ag.subTitulo
					agenda.descripcion = ag.descripcion
					agenda.fecha = ag.fecha.format("dd/MM/yyyy")
					agenda.lugar = ag.lugar
					agenda.hora = ag.hora
					agendas << agenda
				}
				render (template:"agenda", model:["cantidadAgenda":Agenda.count(),"agendas":agendas])
	}
	
	def cargarPagina(){
		def id = params?.id ? params.id : 0

		if(params?.tipo == "0"){
			//pagina

			def datosSubMenu = SubMenu.findById(params.id)
			def idioma = Idioma.findByCodigo('es')
			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
			def img
			def query = Pagina.where { id == datosSubMenu.link }
			def datosPagina = query.find()


			if(datosSubMenu?.multimedia[0]?.contenido){
				img = getImg(datosSubMenu.multimedia[0].contenido)
			}

			render view:'_pagina',model:[entidad:datosPagina,
				menus:listaMenu,
				"imagen":img,
				'pagina':'si',
				titulo:datosSubMenu.titulo
			]


		}else if(params?.tipo == "1"){

			def datosSubMenu = SubMenu.findById(params.id)
			def idioma = Idioma.findByCodigo('es')
			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
			def conf = Configuracion.find("from Configuracion");

			def instance = this.class.classLoader.loadClass("py.org.presidencia."+datosSubMenu.entidad, true)?.newInstance()

			def img
			int limit = conf.cantPagina
			def listaEntidad = instance.executeQuery("FROM ${instance.getClass().name} e order by e.id",[max:limit,offset:0])
			def cantidadRegistros = instance.count()
			render view:'pagina_list', model:[lista:listaEntidad,
				cantidadPg:conf.cantPagina,
				idSubMenu:datosSubMenu.id,
				titulo:"${ datosSubMenu.entidad }",
				menus:listaMenu,
				cantReg:cantidadRegistros
			]


		}else if(params?.tipo == "2"){

			def datosSubMenu = SubMenu.findById(params.id)
			def idioma = Idioma.findByCodigo('es')
			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
			def img
			def query = Pagina.where { id == datosSubMenu.link }
			def datosPagina = query.find()


			if(datosSubMenu?.multimedia[0]?.contenido){
				img = getImg(datosSubMenu.multimedia[0].contenido)
			}

			render view:'_pagina_left',model:[entidad:datosPagina,
				menus:listaMenu,
				"imagen":img,
				'pagina':'si',
				titulo:datosSubMenu.titulo]

		}else if(params?.tipo == "3"){
			indexDocumentos()
		}else{
			redirect(action:"index")
		}




	}

	def cargarNoticia(){
		def id = params?.id ? params.id : 0
		def query = Noticia.where {
			id == id.toInteger()
		}
		def datosNoticia = query.find()
		def idioma = Idioma.findByCodigo('es')
		def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
		def img
		if(datosNoticia){
			img = getImg(datosNoticia.multimedias[0].contenido)
			render view:'_pagina',model:[entidad:datosNoticia,
				menus:listaMenu,
				"imagen":img,
				'pagina':'no']
		}
	}
	
	def cargarAgenda(){
		def id = params?.id ? params.id : 0
		def query = Agenda.where {
			id == id.toInteger()
		}
		def datosAgenda = query.find()
		def idioma = Idioma.findByCodigo('es')
		def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
		def img
		if(datosAgenda){
			
			render view:'_pagina',model:[entidad:datosAgenda,
				menus:listaMenu,
				'pagina':'no']
		}
	}
	
	

	def cargarDetalleAgenda(){

		def id = params?.id ? params.id : 0
		def query = Agenda.where {
			id == id.toInteger()
		}
		def datosAgenda = query.find()
		def idioma = Idioma.findByCodigo('es')
		def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
		//def img
		if(datosAgenda){
			//eliminamos este codigo para no renderizar contenido multimedia
			//img = getImg(datosAgenda.multimedias[0].contenido)
			render view:'_pagina',model:[entidad:datosAgenda,
				menus:listaMenu,
				//"imagen":img,
				'pagina':'no',
				'lista':datosAgenda.categoria
			]
		}
	}	

	def ajaxGetEntidad(){

		def conf = Configuracion.find("FROM Configuracion");
		int limit = params?.max != 0 ? params.max.toInteger() : conf.cantPagina
		int reg = params?.offset != 0 ? params.offset.toInteger() : 0
		def id = params?.id ? params.id : 0
		def subMenu = SubMenu.findById(id);

		if(subMenu){
			def instance = this.class.classLoader.loadClass("py.org.presidencia."+subMenu.entidad, true)?.newInstance()
			def cantidadRegistros = instance.count()
			def listaEntidad = instance.findAll("FROM ${instance.getClass().name} s order by s.id",[max: limit,offset: reg])
			render template:'pagina_list', model:[lista:listaEntidad,
				pgCantidad:cantidadRegistros
				,idSubMenu:id]
		}
	}

	def cargarPaginas(){

		int id = params?.id ? params.id.toInteger() : 0
		int id_entidad = params?.ent ? params.ent.toInteger() : 0

		if(id != 0 && id_entidad !=0){
			def datosSubMenu = SubMenu.find("FROM SubMenu s where s.id = ?",id.toLong())
			def idioma = Idioma.findByCodigo('es')
			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
			def listaEntidades = grailsApplication.domainClasses.sort { it.fullName }
			def nombreEntidad = listaEntidades.find{it.name == datosSubMenu.entidad}
			def instance = this.class.classLoader.loadClass(nombreEntidad.fullName, true)?.newInstance()
			def entidad = instance.executeQuery("FROM ${instance.getClass().name} e WHERE e.id = ?",id_entidad.toLong())[0];
			def img = getImg(entidad.multimedias[0].contenido)
			render view:'_pagina',model:[entidad:entidad,
				menus:listaMenu,
				"imagen":img,
				'pagina':'no'
			]
		}else{
			redirect action:'index'
		}


	}

	def indexDocumentos(){

		def idioma = Idioma.findByCodigo('es')
		//def listaMenu = Menu.findAllByActivo(true,[sort:"id"])
		def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
		render( view:'documentos',model:[tipo:'decreto',menus:listaMenu])
	}

	def ajaxDocumentos(){

		def conf = Configuracion.find("FROM Configuracion");
		if(params?.tipo in [
			'decreto',
			'circular',
			'resolucion'
		]){
			def param = [:]
			def tipo = params?.tipo.substring(0,1).toUpperCase() + params?.tipo.substring(1)
			param.put("tipo","${tipo}")
			def query = "FROM Documento d join d.tipo WHERE  d.tipo.descripcion = :tipo "
			def numero = params?.numero ? params.numero : ""
			def descripcion = params?.descripcion ? params?.descripcion : ""
			def fecha = params?.fecha ? params?.fecha : ""

			if(numero != "" || descripcion != "" || fecha !="" ){
				query = "$query "

				if(numero != ""){
					query = " $query and d.numero like :num "
					param.put("num","%${numero}%")
				}
				if(descripcion != ""){
					query = " $query and upper(d.descripcion) like upper(:desc) "
					descripcion = descripcion.replaceAll(" ","%")
					param.put("desc","%${descripcion}%")
				}
				if(fecha != ""){
					query = " $query and cast(d.fecha as string) like :fecha "
					param.put("fecha","%${fecha}%")
				}

				query = "$query  order by d.id asc"
			}


			def offset = params?.ind ? (params.ind.toInteger() - 1) * conf.cantPagina : 0
			def offset2 = params?.ind ? (params.ind.toInteger() - 1) * conf.cantPagina : 0
			
			def cantidadReg = Documento.findAll(query,param).size()
			
			
			
			param.put("offset",offset)
			param.put("max",conf.cantPagina)
			
			def listaDatos = Documento.findAll(query,param)
			def lista = []
			for(int i=0; i< listaDatos.size();i++ ){
				lista << listaDatos[i][0]
			}

			def cantiRegView=lista.size();

			def cantidadPag = conf.cantPagina


			render template:'table_documento',
			model:["listado":lista,'cantPag':cantidadPag,'cantReg':cantidadReg]
		}

	}

	def getDocumento(){

		def id = params?.id ? params?.id : 0
		if( id != 0){
			def documento = Documento.get(id)
			def nombre = "${documento.tipo.descripcion}-${documento.numero}"

			if(documento.zip){

				response.setContentType("application/zip")
				response.addHeader("content-disposition","attachment; filename=${nombre}.zip");
				response.setContentLength((int)documento.adjunto.size())
				response.outputStream << documento.adjunto

			}else{

				response.setContentType("application/pdf; name=${nombre}.pdf")
				response.addHeader("content-disposition","inline; filename=${nombre}.pdf");
				response.addHeader("pagination","no-pagination");
				response.setContentLength((int)documento.adjunto.size())
				response.outputStream << documento.adjunto
			}

		}
	}

	def buscarContenido(){

		def cadenaAbuscar = params?.cadena ? params.cadena.replaceAll(" ","%") :""
		def listaDatos = []

		if(cadenaAbuscar){

			def noticias = Noticia.
					executeQuery(""" 
											FROM Noticia as n where upper(n.titulo) 
												like upper(:cadena) or upper(n.subTitulo) 
												like upper(:cadenau) or upper(descripcion) like upper(:cadenad)""",
					[cadena:"%$cadenaAbuscar%",cadenau:"%$cadenaAbuscar%",cadenad:"%$cadenaAbuscar%"])
			def agendas = Agenda.
					executeQuery("""
											FROM Agenda as a where upper(a.titulo) 
											like upper(:cadena) or upper(a.subTitulo) 
											like upper(:cadenau) or upper(a.descripcion) like upper(:cadenad)""",
					[cadena:"%$cadenaAbuscar%",cadenau:"%$cadenaAbuscar%",cadenad:"%$cadenaAbuscar%"])
			def idioma = Idioma.findByCodigo('es')
			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")

			noticias.each { listaDatos << it }

			agendas.each { listaDatos << it }

			render view:'buscador_list',model:[lista:listaDatos,menus:listaMenu]
		}else{
			redirect(view:"index")
		}
	}

	def mostarPagina(){

		if(params?.id){
			def idioma = Idioma.findByCodigo('es')
			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")
			def noticia = Noticia.find("FROM Noticia n WHERE n.id = :id",[id:params.id.toLong()])
			if(noticia){
				
				def img = getImg(noticia.multimedias[0].contenido)
				render view:'_pagina',model:[
												entidad:noticia,
												menus:listaMenu,
												"imagen":img,
												'pagina':'no'
											 ]
			}else{
			
				def agenda = Agenda.find("FROM Agenda a WHERE a.id = :id",[id:params.id.toLong()])

				if(agenda){
					
					def img = getImg(agenda.multimedias[0].contenido)
					render view:'_pagina',model:
											[
												entidad:agenda,
												menus:listaMenu,
												"imagen":img,
												'pagina':'no'
											]
				}else{
				
					def pagina = Pagina.find("FROM Pagina a WHERE a.id = :id",[id:params.id.toLong()])
					def multimedia = Multimedia.findByImagenPorDefecto(true)
					def img = getImg(multimedia.contenido)
					render view:'_pagina',
					model:[
							entidad:pagina,
							menus:listaMenu,
							"imagen":img,
							'pagina':'si'
						  ]
				}

			}

		}
	}

	def cargarMenu(){

		if(params?.codigo){
			def idioma = Idioma.findByCodigo(params.codigo)

			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")

			render template : 'menu', model:['menus':listaMenu]

		}
	}

	def obtenerIdiomas(){
		def idiomas = Idioma.list();

		render template:'idioma',model:[idioma:idiomas]
	}

	def ajaxTabs(){
		def listaDeDocumento


		if(params?.tab && params?.tab in [
			'resolucion',
			'circular',
			'decreto'
		]){
			def conf = Configuracion.find("FROM Configuracion")
			switch(params.tab){
				case 'resolucion':
					def resolucion  = TipoDocumento.findByDescripcion("Resolucion")
					def cantidadReg = Documento.findAllByTipo(resolucion).size()
					listaDeDocumento = Documento.findAllByTipo(resolucion,[max:conf.cantPagina])
					render template: 'table_documento',
					model:[
						listado:listaDeDocumento,
						tipo:'Resolucion',
						'cantPag':conf.cantPagina,
						'cantReg':cantidadReg
					]
					break
				case 'circular':
					def circular = TipoDocumento.findByDescripcion("Circular")
					def cantidadReg = Documento.findAllByTipo(circular).size()
					listaDeDocumento = Documento.findAllByTipo(circular,[max:conf.cantPagina])
					render template: 'table_documento',
					model:[
						listado:listaDeDocumento,
						tipo:'Circular',
						'cantPag':conf.cantPagina,
						'cantReg':cantidadReg
					]
					break
				case 'decreto':
					def decreto = TipoDocumento.findByDescripcion("Decreto")
					def cantidadReg = Documento.findAllByTipo(decreto).size()
					listaDeDocumento = Documento.findAllByTipo(decreto,[max:conf.cantPagina])
					render template: 'table_documento',
					model:[
						listado:listaDeDocumento,
						tipo:'Decreto',
						'cantPag':conf.cantPagina,
						'cantReg':cantidadReg
					]
					break
			}


		}
	}

	def mostrarTag(){
		def categoria
		def listaDeInfo = []

		if(params?.id){
			categoria = Categoria.get(params.id.toInteger())
			listaDeInfo.addAll(Noticia.findAllByCategoria(categoria))
			listaDeInfo.addAll(Agenda.findAllByCategoria(categoria))
			listaDeInfo.addAll(Pagina.findAllByCategoria(categoria))
			def idioma = Idioma.findByCodigo('es')
			def listaMenu = Menu.executeQuery(" FROM Menu m WHERE m.activo = true and m.idioma = $idioma.id order by m.orden")

			render view:'tag_list', model:[menus:listaMenu,lista:listaDeInfo,cat: categoria.descripcion]
		}else{
			redirect(view:"index")
		}

	}
}

