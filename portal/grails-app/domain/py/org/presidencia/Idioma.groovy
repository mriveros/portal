package py.org.presidencia

class Idioma {
	String descripcion
	String codigo
    static constraints = {
		descripcion blank: false
		codigo blank: false, nullable: true
    }
	
	String toString(){
		return "${descripcion}"	
	}
}
