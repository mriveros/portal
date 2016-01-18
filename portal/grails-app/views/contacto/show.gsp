
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Contacto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contacto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contacto">
			
				<g:if test="${contactoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="contacto.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${contactoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${contactoInstance?.remitente}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="remitente-label" class="property-label"><g:message code="contacto.remitente.label" default="Remitente" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="remitente-label"><g:fieldValue bean="${contactoInstance}" field="remitente"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${contactoInstance?.destinatario}">
				<li class="fieldcontain">
					<span id="destinatario-label" class="property-label"><g:message code="contacto.destinatario.label" default="Destinatario" /></span>
					
						<span class="property-value" aria-labelledby="destinatario-label"><g:fieldValue bean="${contactoInstance}" field="destinatario"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${contactoInstance?.correo}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="correo-label" class="property-label"><g:message code="contacto.correo.label" default="Correo" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${contactoInstance}" field="correo"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${contactoInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="contacto.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label">${PresidenciaService.getBooleanDescp(contactoInstance?.activo)}</span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${contactoInstance?.asunto}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="asunto-label" class="property-label"><g:message code="contacto.asunto.label" default="Asunto" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="asunto-label"><g:fieldValue bean="${contactoInstance}" field="asunto"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${contactoInstance?.institucion}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="contacto.institucion.label" default="Institucion" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label"><g:link controller="institucion" action="show" id="${contactoInstance?.institucion?.id}">${contactoInstance?.institucion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contactoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contactoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
