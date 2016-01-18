
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.SubMenu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subMenu.label', default: 'SubMenu')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subMenu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subMenu" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'subMenu.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="activo" title="${message(code: 'subMenu.activo.label', default: 'Activo')}" />
					
						<th><g:message code="subMenu.idioma.label" default="Idioma" /></th>
					
						<g:sortableColumn property="link" title="${message(code: 'subMenu.link.label', default: 'Link')}" />
					
						<th><g:message code="subMenu.menu.label" default="Menu" /></th>
					
						<g:sortableColumn property="ventana" title="${message(code: 'subMenu.ventana.label', default: 'Ventana')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subMenuInstanceList}" status="i" var="subMenuInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subMenuInstance.id}">${fieldValue(bean: subMenuInstance, field: "titulo")}</g:link></td>
					
						<td><g:formatBoolean boolean="${subMenuInstance.activo}" /></td>
					
						<td>${fieldValue(bean: subMenuInstance, field: "idioma")}</td>
					
						<td>${fieldValue(bean: subMenuInstance, field: "link")}</td>
					
						<td>${fieldValue(bean: subMenuInstance, field: "menu")}</td>
					
						<td>${PresidenciaService.getVentaDescripcion(subMenuInstance.ventana)}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subMenuInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
