package py.org.presidencia

class Persona {
	
	String nombre
	String apellido
	String ci
	
	
	static mapping = {
		ci column: 'documento_identidad' 
		id column: 'id_persona'
		nombre column: 'nombre'
		apellido column : 'apellido'
	}
	
	static constraints = {
		nombre nullable: true
		apellido nullable: true 
	}

}
