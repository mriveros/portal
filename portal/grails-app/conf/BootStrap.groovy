import py.org.presidencia.Requestmap

class BootStrap {

    def init = { servletContext ->
//		for (String url in [
//			'/', '/error', '/index','/index/*', 
//			'/index.gsp','/index/*/*', '/**/favicon.ico',
//			'/**/js/**', '/**/css/**', '/**/images/**',
//			'/login', '/login.*', '/login/*',
//			'/logout', '/logout.*', '/logout/*'
//			,'/index/cargarNoticia/**','/index/indexDocumentos/**',
//			'/index/cargarPagina/**','/index/cargarPaginas/**',
//			'/index/index/**','/index/getDocumento/**',
//			'/index/getDetalle/**','/index/getImg/**',
//			'/index/cargarDetalleAgenda/**','/cargarDetalleAgenda/**'
//			,'/contacto/sendMail/**','/simpleCaptcha/captcha/**',
//			'/contacto/getPersona**','/contacto/contacto/**'
//			]) {
//		 new Requestmap(url: url, configAttribute: 'permitAll').save(insert:false)
//	  }
		// new Users (url: url, configAttribute: 'permitAll').save(insert:true)
    }
    def destroy = {
    }
}
