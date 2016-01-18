package py.org.presidencia

class TipoDocumento {
	String descripcion
	
    static constraints = {
    }
	
	String toString(){
		return "${descripcion}"
	}
}
