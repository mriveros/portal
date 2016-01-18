package py.org.presidencia

class Servicio {
	String nombre
	String url

    static constraints = {
		nombre blank:false
		url blank:false 
    }
	
	static belongsTo = [institucion:Institucion]
}
