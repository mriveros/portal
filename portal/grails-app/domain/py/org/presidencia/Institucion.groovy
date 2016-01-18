package py.org.presidencia

class Institucion {
	String nombre
	boolean activo
	
	
    static constraints = {
		nombre blank: false
    }
	
	String toString(){
		return "${nombre}"
	}
	
	static hasMany = [
		noticias:Noticia,
		agendas:Agenda,
		servicios:Servicio,
		contactos:Contacto,
		paginas:Pagina
	]
}
