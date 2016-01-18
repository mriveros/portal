package py.org.presidencia

class Menu {
	String titulo
	boolean activo
	Idioma idioma
	boolean noEditable
	Integer orden
	
	static constraints = { 
		titulo blank: false
		noEditable blank:true
		orden nullable:true, unique: true
	}
	
	static hasMany = [
		subMenus:SubMenu
	]
	String toString(){
		return "${titulo}"
	}
}
