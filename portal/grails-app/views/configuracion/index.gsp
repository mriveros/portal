
<%@ page import="py.org.presidencia.Configuracion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracion.label', default: 'Configuracion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-configuracion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configuracion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="host" title="${message(code: 'configuracion.host.label', default: 'Host')}" />
					
						<g:sortableColumn property="usuario" title="${message(code: 'configuracion.usuario.label', default: 'Usuario')}" />
					
<%--						<g:sortableColumn property="password" title="${message(code: 'configuracion.password.label', default: 'Password')}" />--%>
					
						<g:sortableColumn property="cantAgendaPag" title="${message(code: 'configuracion.cantAgendaPag.label', default: 'Cant. Reg.(Agenda)')}" />
					
						<g:sortableColumn property="cantNoticiaPag" title="${message(code: 'configuracion.cantNoticiaPag.label', default: 'Cant. Reg.(Noticia)')}" />
					
						<g:sortableColumn property="cantPagina" title="${message(code: 'configuracion.cantPagina.label', default: 'Cant. Reg.(Pagina)')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configuracionInstanceList}" status="i" var="configuracionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configuracionInstance.id}">${fieldValue(bean: configuracionInstance, field: "host")}</g:link></td>
					
						<td>${fieldValue(bean: configuracionInstance, field: "usuario")}</td>
					
<%--						<td>${fieldValue(bean: configuracionInstance, field: "password")}</td>--%>
					
						<td>${fieldValue(bean: configuracionInstance, field: "cantAgendaPag")}</td>
					
						<td>${fieldValue(bean: configuracionInstance, field: "cantNoticiaPag")}</td>
					
						<td>${fieldValue(bean: configuracionInstance, field: "cantPagina")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configuracionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
