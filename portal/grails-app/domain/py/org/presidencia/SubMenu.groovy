package py.org.presidencia

class SubMenu {
	String titulo
	boolean activo
	String link
	String ventana //_blank, _self
	Idioma idioma
	String tipo
	String entidad
	Integer orden
	
	static constraints = {
		 
		titulo blank:false 
		tipo nullable:true
		entidad nullable:true
		link nullable:true
		orden nullable: true
		orden unique:['menu','idioma']
		
		}

	static hasMany = [
		multimedia:Multimedia
	]
	static belongsTo = [menu:Menu]
	
	String toString(){
		return "${titulo}"
	}
	
}

