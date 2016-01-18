package py.org.presidencia

import org.apache.commons.codec.binary.Base64;
class Multimedia {

	String descripcion
	byte[] contenido
	boolean imagenPorDefecto
	
    static constraints = {
		descripcion blank: false
		contenido blank:false, maxSize: 1024 * 1024 * 3
		imagenPorDefecto nullable:false
    }
	static belongsTo = [Noticia,Agenda,SubMenu]
	static hasMany = [
		noticias:Noticia,
		agendas:Agenda,
		subMenus:SubMenu
	]
	
	String getImg(){
		byte[] encodeBase64 = Base64.encodeBase64(contenido);
		String base64DataString = new String(encodeBase64 , "UTF-8");
		String data = "data:image/jpeg;base64,${base64DataString}"
		return data
	}
	String toString(){
		return "${descripcion}"
	}
	
}
