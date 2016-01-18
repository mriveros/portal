<%@ page import="py.org.presidencia.Perfil" %>



<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="perfil.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${perfilInstance?.nombre}"/>

</div>

