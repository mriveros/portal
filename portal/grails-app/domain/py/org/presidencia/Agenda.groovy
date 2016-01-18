package py.org.presidencia

import java.sql.Time

class Agenda {
	
	Date fecha
	Date hora
	String titulo
	String subTitulo	
	String descripcion
	String lugar
	Boolean activo=true

	
	Categoria categoria

    static constraints = {
		fecha blank:false
		lugar blank: true,nullable: true
		hora blank: false
		titulo blank: false, maxSize:100
		subTitulo blank:false, maxSize:150
		descripcion  blank: false
		activo nullable:true
		
		categoria nullable: true
		
    }
	
/*	
	static hasMany = [
		multimedias:Multimedia
	]
*/
	static belongsTo = [
		institucion:Institucion
	]
	
	String toString(){
		return "${titulo}"
	}
}
	
