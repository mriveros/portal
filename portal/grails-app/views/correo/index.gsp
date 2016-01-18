
<%@ page import="py.org.presidencia.Correo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'correo.label', default: 'Correo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-correo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-correo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nrotelefonico" title="${message(code: 'correo.nrotelefonico.label', default: 'Nrotelefonico')}" />
					
						<g:sortableColumn property="ip" title="${message(code: 'correo.ip.label', default: 'Ip')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'correo.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'correo.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'correo.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="asunto" title="${message(code: 'correo.asunto.label', default: 'Asunto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${correoInstanceList}" status="i" var="correoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${correoInstance.id}">${fieldValue(bean: correoInstance, field: "nrotelefonico")}</g:link></td>
					
						<td>${fieldValue(bean: correoInstance, field: "ip")}</td>
					
						<td>${fieldValue(bean: correoInstance, field: "fecha")}</td>
					
						<td>${fieldValue(bean: correoInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: correoInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: correoInstance, field: "asunto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${correoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
