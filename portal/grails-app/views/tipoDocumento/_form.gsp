<%@ page import="py.org.presidencia.TipoDocumento" %>



<div class="fieldcontain ${hasErrors(bean: tipoDocumentoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoDocumento.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoDocumentoInstance?.descripcion}"/>

</div>

