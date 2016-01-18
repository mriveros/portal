package py.org.presidencia

import org.apache.commons.codec.binary.Base64;


class Documento {
	
	String numero
	Date fecha
	String descripcion
	TipoDocumento tipo
	Boolean zip
	
	byte[] adjunto

	
    static constraints = {
		numero blank:false
		descripcion blank:false
		zip nullable:true
		adjunto maxSize: 1024*1014 * 10
    }
	
	String getDocumento(){
		byte[] dataEncode64 = Base64.encodeBase64(this.adjunto) 
		String data = new String(dataEncode64,"UTF-8")
		data = "data:imagen/jpg;base64,${data}"
		
		return data
		
	}
	
}

