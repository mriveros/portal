package py.org.presidencia

class Noticia {
	
	Date fecha
	Date hora
	String titulo
	String subTitulo
	String descripcion
	boolean destacado
	boolean permanente
	boolean slider
	
	Categoria categoria
	
    static constraints = {
		 fecha blank:false
		 hora blank:false
		 titulo blank:false,maxSize:100
		 subTitulo blank:false
		descripcion blank:false
		permanente nullable:false
		categoria nullable:true
    }
	static belongsTo = [institucion:Institucion]	
	static hasMany = [
		multimedias:Multimedia
	]
	
	String toString(){
		return "${titulo}"
	}
}

