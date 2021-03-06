
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Institucion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institucion.label', default: 'Institucion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-institucion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-institucion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'institucion.nombre.label', default: 'Nombre')}" />
					
<%--						<th><g:message code="institucion.usuario.label" default="Usuario" /></th>--%>
					
						<g:sortableColumn property="activo" title="${message(code: 'institucion.activo.label', default: 'Activo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${institucionInstanceList}" status="i" var="institucionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${institucionInstance.id}">${fieldValue(bean: institucionInstance, field: "nombre")}</g:link></td>
					
<%--						<td>${fieldValue(bean: institucionInstance, field: "usuario")}</td>--%>
					
						<td>${PresidenciaService.getBooleanDescp(institucionInstance?.activo)}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${institucionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
