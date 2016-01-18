package py.org.presidencia

class Configuracion {
	
	Integer cantNoticiaPag
	Integer cantAgendaPag
	Integer cantPagina
	String  host
	String usuario
	String password
	String port
	
	Institucion institucion
	
	
    static constraints = {
		host nullable : true
		usuario nullable: true
		password nullable: true
		port nullable: true
		institucion nullable:true
		
    }
}
