
<%@ page import="py.org.presidencia.Pagina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagina.label', default: 'Pagina')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagina" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Crear Pagina </g:link></li>
			</ul>
		</div>
		<div id="list-pagina" class="content scaffold-list" role="main">
			<h1>Listado de Paginas</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						
						<g:sortableColumn property="id" title="${message(code: 'pagina.titulo.label', default: 'ID')}" />
						<g:sortableColumn property="titulo" title="${message(code: 'pagina.titulo.label', default: 'TITULO')}" />
					
						<th><g:message code="pagina.institucion.label" default="INSTITUCION" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paginaInstanceList}" status="i" var="paginaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${paginaInstance.id}">${fieldValue(bean: paginaInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: paginaInstance, field: "titulo")}</td>
						<td>${fieldValue(bean: paginaInstance, field: "institucion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${paginaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
