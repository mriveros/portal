package py.org.presidencia

class Correo {
	
	String nombre
	String apellido
	String ci
	String nrotelefonico
	String email
	String asunto
	String mensaje
	String ip
	String fecha
	
	static constraints = {
		nrotelefonico blank: true, nullable: true
		ip nullable : true
		fecha nullable: true
		email email: true
	}
	
}
