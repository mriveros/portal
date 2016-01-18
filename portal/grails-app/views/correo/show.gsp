
<%@ page import="py.org.presidencia.Correo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'correo.label', default: 'Correo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-correo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-correo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list correo">
			
				<g:if test="${correoInstance?.nrotelefonico}">
				<li class="fieldcontain">
					<span id="nrotelefonico-label" class="property-label"><g:message code="correo.nrotelefonico.label" default="Nrotelefonico" /></span>
					
						<span class="property-value" aria-labelledby="nrotelefonico-label"><g:fieldValue bean="${correoInstance}" field="nrotelefonico"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.ip}">
				<li class="fieldcontain">
					<span id="ip-label" class="property-label"><g:message code="correo.ip.label" default="Ip" /></span>
					
						<span class="property-value" aria-labelledby="ip-label"><g:fieldValue bean="${correoInstance}" field="ip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="correo.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:fieldValue bean="${correoInstance}" field="fecha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="correo.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${correoInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="correo.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${correoInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.asunto}">
				<li class="fieldcontain">
					<span id="asunto-label" class="property-label"><g:message code="correo.asunto.label" default="Asunto" /></span>
					
						<span class="property-value" aria-labelledby="asunto-label"><g:fieldValue bean="${correoInstance}" field="asunto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.ci}">
				<li class="fieldcontain">
					<span id="ci-label" class="property-label"><g:message code="correo.ci.label" default="Ci" /></span>
					
						<span class="property-value" aria-labelledby="ci-label"><g:fieldValue bean="${correoInstance}" field="ci"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.mensaje}">
				<li class="fieldcontain">
					<span id="mensaje-label" class="property-label"><g:message code="correo.mensaje.label" default="Mensaje" /></span>
					
						<span class="property-value" aria-labelledby="mensaje-label"><g:fieldValue bean="${correoInstance}" field="mensaje"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${correoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="correo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${correoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:correoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${correoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
