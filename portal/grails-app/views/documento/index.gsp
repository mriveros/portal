
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Documento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documento.label', default: 'Documento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-documento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-documento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'documento.numero.label', default: 'Numero')}" />				
						<g:sortableColumn property="descripcion" title="${message(code: 'documento.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'documento.fecha.label', default: 'Fecha')}" />
										
						<th><g:message code="documento.tipo.label" default="Tipo" /></th>
<%--						<g:sortableColumn property="adjunto" title="${message(code: 'documento.adjunto.label', default: 'Adjunto')}" />--%>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentoInstanceList}" status="i" var="documentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${documentoInstance.id}">${fieldValue(bean: documentoInstance, field: "numero")}</g:link></td>
					
						<td>${PresidenciaService.getSubString(documentoInstance.descripcion, 60)}</td>
					
						<td><g:formatDate date="${documentoInstance.fecha}" format="dd/MM/yyyy"/></td>
					
						<td>${fieldValue(bean: documentoInstance, field: "tipo")}</td>
<%--						<td>${documentoInstance.getDocumento()}</td>--%>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
