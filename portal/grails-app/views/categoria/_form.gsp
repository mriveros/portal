<%@ page import="py.org.presidencia.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="categoria.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="50" required="" value="${categoriaInstance?.descripcion}"/>

</div>

