package py.org.presidencia

class Categoria {
	
	String descripcion

    static constraints = {
		descripcion maxSize: 50,blank:false,unique:true
    }
	
	String toString(){
		return "$descripcion"
	}
	
}
