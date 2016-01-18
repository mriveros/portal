package py.org.presidencia

class Pagina {
	String titulo
	String subTitulo
	String cuerpo
	
	Categoria categoria
		
	static belongsTo =[institucion:Institucion]
	
    static constraints = {
			titulo blank :false, maxSize:100
			subTitulo blank:false
			cuerpo blank:false
			categoria nullable: true
    }
	
	static hasMany = [multimedias:Multimedia]
	
}

