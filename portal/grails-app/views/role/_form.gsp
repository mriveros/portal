<%@ page import="py.org.presidencia.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="role.name.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${roleInstance?.name}"/>

</div>

