
<%@ page import="py.org.presidencia.Documento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-documento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-documento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list documento">
			
<%--				<g:if test="${documentoInstance?.adjunto}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="adjunto-label" class="property-label"><g:message code="documento.adjunto.label" default="Adjunto" /></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${documentoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="documento.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${documentoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="documento.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${documentoInstance?.fecha}" format="dd/MM/yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="documento.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${documentoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentoInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="documento.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoDocumento" action="show" id="${documentoInstance?.tipo?.id}">${documentoInstance?.tipo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${documentoInstance?.id}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="documento.link.label" default="Enlace" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="index" action="getDocumento" id="${documentoInstance?.id}">Mostrar</g:link></span>
					
				</li>  
				</g:if>
			
			</ol>
			<g:form url="[resource:documentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${documentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

