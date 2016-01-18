<%@ page import="py.org.presidencia.Idioma" %>



<div class="fieldcontain ${hasErrors(bean: idiomaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="idioma.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${idiomaInstance?.descripcion}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: idiomaInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="idioma.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" value="${idiomaInstance?.codigo}"/>

</div>

