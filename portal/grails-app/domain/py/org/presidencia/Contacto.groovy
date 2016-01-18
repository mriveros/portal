package py.org.presidencia

import org.apache.tools.ant.util.LayoutPreservingProperties.Blank;

class Contacto {
	String titulo
	String remitente
	String destinatario
	boolean activo
	String asunto
	String correo

    static constraints = {
		titulo blank:false
		remitente email:true, blank:false
		destinatario email:true, blank:false
		correo blank:false
    }
	static belongsTo = [institucion:Institucion]
}
