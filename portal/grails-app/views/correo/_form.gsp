<%@ page import="py.org.presidencia.Correo" %>



<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'nrotelefonico', 'error')} ">
	<label for="nrotelefonico">
		<g:message code="correo.nrotelefonico.label" default="Nrotelefonico" />
		
	</label>
	<g:textField name="nrotelefonico" value="${correoInstance?.nrotelefonico}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'ip', 'error')} ">
	<label for="ip">
		<g:message code="correo.ip.label" default="Ip" />
		
	</label>
	<g:textField name="ip" value="${correoInstance?.ip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'fecha', 'error')} ">
	<label for="fecha">
		<g:message code="correo.fecha.label" default="Fecha" />
		
	</label>
	<g:textField name="fecha" value="${correoInstance?.fecha}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="correo.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${correoInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="correo.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${correoInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'asunto', 'error')} ">
	<label for="asunto">
		<g:message code="correo.asunto.label" default="Asunto" />
		
	</label>
	<g:textField name="asunto" value="${correoInstance?.asunto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'ci', 'error')} ">
	<label for="ci">
		<g:message code="correo.ci.label" default="Ci" />
		
	</label>
	<g:textField name="ci" value="${correoInstance?.ci}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'mensaje', 'error')} ">
	<label for="mensaje">
		<g:message code="correo.mensaje.label" default="Mensaje" />
		
	</label>
	<g:textField name="mensaje" value="${correoInstance?.mensaje}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: correoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="correo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${correoInstance?.nombre}"/>

</div>

