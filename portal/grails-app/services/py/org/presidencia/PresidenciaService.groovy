package py.org.presidencia

import grails.transaction.Transactional

import java.util.zip.ZipEntry
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream


@Transactional
class PresidenciaService {

	static MAX_SIZE = 1024 * 1014 * 3
	
	static getSubString(cadena,longitud=100) {
		if(cadena.length() >= longitud){
			def sub = cadena.substring(0,longitud)
			sub = "$sub ..."
			return sub.toString()
		}else{
			return cadena
		}
	}
	static getSubString70(cadena,longitud=70) {
		if(cadena.length() >= longitud){
			def sub = cadena.substring(0,longitud)
			sub = "$sub ..."
			return sub.toString()
		}else{
			return cadena
		}
	}

	static pagination(params,paginacion,clazz){
		def lista = []
		def maptoRet = [:]

		paginacion.pag = clazz.executeQuery("SELECT COUNT(*) FROM ${clazz.name}")[0]
		paginacion.cantPag = (paginacion.pag % params.max) == 0 ? (int)(paginacion.pag / params.max) : (int)((paginacion.pag / params.max) + 1)
		paginacion.offSet =  params?.pagina != null ? (params.pagina.toInteger() -1) * params.max.toInteger()  : 0

		lista = clazz.findAll("FROM ${clazz.name} order by id ",[max:params.max,offset:paginacion.offSet])
		maptoRet.put("lista",lista)
		maptoRet.put("pagina",paginacion)

		return maptoRet
	}

	static getTipoDescripcion(String tipo) {

		switch(tipo){
			case "0":
				return "Pagina"
				break
			case "1":
				return "Listado"
				break
			case "2":
				return "Pagina con imagen a la Izquierda"
				break
			case "3":
				return "Actos Administrativos"
				break
		}
	}

	static getVentaDescripcion(String ventana) {

		switch(ventana){
			case "_blank":
				return "Nueva Ventana"
				break
			case "_top":
				return "Ventana Principal"
				break
			case "_self":
				return "Misma Ventana"
				break
			case "_parent":
				return "Ventana Padre"
				break
		}
	}

	static getBooleanDescp(boolean val){
		if(val){
			return "Si"
		}else{
			return "No"
		}
	}

	static comprimir(datos,nombre){

		ByteArrayOutputStream out = new ByteArrayOutputStream()
		ZipOutputStream zipOut = new ZipOutputStream(out)
		ZipEntry entrada = new ZipEntry(nombre);
		zipOut.putNextEntry(entrada)
		InputStream ins = new ByteArrayInputStream(datos);
		byte[] buffer = new byte[1024]
		int byteLeido = 0

		while(0 < (byteLeido = ins.read(buffer))){
			zipOut.write(buffer,0,byteLeido)
		}
		
		
		zipOut.close()
		
		return out.toByteArray()
	}

	static desComprimir(datos){

		InputStream ins = new ByteArrayInputStream(datos)
		ZipInputStream zipIn = new ZipInputStream(ins)
		ByteArrayOutputStream out = new ByteArrayOutputStream()
		//ZipEntry ze = zipIn.getNextEntry()
		byte[] buffer = new byte[2048]

		int byteLeido = 0;
		while((byteLeido = zipIn.read(buffer)) > 0){
			out.write(buffer,0,byteLeido)
		}
		ins.close()
		zipIn.close()
		return out.toByteArray()

	}
	
	static nombreZip(datos){
		InputStream ins = new ByteArrayInputStream(datos)
		ZipInputStream zipIn = new ZipInputStream(ins)
		ZipEntry ze = zipIn.getNextEntry()
		String nombreZip = "";
		if(ze != null){
			nombreZip = ze.getName()
		}
		
		ins.close()
		zipIn.close()
		
		return nombreZip
	}
}


