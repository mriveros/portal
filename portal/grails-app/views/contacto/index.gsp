
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Contacto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contacto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'contacto.titulo.label', default: 'Titulo')}" />
					
<%--						<g:sortableColumn property="remitente" title="${message(code: 'contacto.remitente.label', default: 'Remitente')}" />--%>
						<g:sortableColumn property="institucion" title="${message(code: 'contacto.institucion.label', default: 'Institucion')}" />
						
					
						<g:sortableColumn property="destinatario" title="${message(code: 'contacto.destinatario.label', default: 'Destinatario')}" />
					
<%--						<g:sortableColumn property="correo" title="${message(code: 'contacto.correo.label', default: 'Correo')}" />--%>
					
						<g:sortableColumn property="activo" title="${message(code: 'contacto.activo.label', default: 'Activo')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactoInstanceList}" status="i" var="contactoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactoInstance.id}">${fieldValue(bean: contactoInstance, field: "titulo")}</g:link></td>
					
<%--						<td>${fieldValue(bean: contactoInstance, field: "remitente")}</td>--%>
						<td>${fieldValue(bean: contactoInstance, field: "institucion")}</td>
					
						<td>${fieldValue(bean: contactoInstance, field: "destinatario")}</td>
					
<%--						<td>${fieldValue(bean: contactoInstance, field: "correo")}</td>--%>
					
						<td>${PresidenciaService.getBooleanDescp(contactoInstance.activo)}</td>
					
<%--						<td>${fieldValue(bean: contactoInstance, field: "asunto")}</td>--%>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
