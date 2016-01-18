<%@ page import="py.org.presidencia.Persona" %>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${personaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="persona.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${personaInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'ci', 'error')} ">
	<label for="ci">
		<g:message code="persona.ci.label" default="Ci" />
		
	</label>
	<g:textField name="ci" value="${personaInstance?.ci}"/>

</div>

