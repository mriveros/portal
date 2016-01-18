
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[Usuario]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Crear Usuario</g:link></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1>Listado de Usuario</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Nombre de Usuario')}" />
					
<%--						<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />--%>
					
<%--						<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Cuenta Expirada')}" />--%>
					
<%--						<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Cuenta Bloqueada')}" />--%>
						<g:sortableColumn property="institucion" title="${message(code: 'user.institucion.label', default: 'Instituci&oacute;n')}" />
						
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Activo')}" />
					
<%--						<g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Contrase&ntilde;a Expirada')}" />--%>
						
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
					
<%--						<td>${fieldValue(bean: userInstance, field: "password")}</td>--%>
					
<%--						<td>${PresidenciaService.getBooleanDescp(userInstance?.accountExpired)}</td>--%>
<%--					--%>
<%--						<td>${PresidenciaService.getBooleanDescp(userInstance?.accountLocked)}</td>--%>
						<td>${userInstance.institucion.nombre}</td>	
						<td>${PresidenciaService.getBooleanDescp(userInstance?.enabled)}</td>
					
<%--						<td>${PresidenciaService.getBooleanDescp(userInstance?.passwordExpired)}</td>--%>
										
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
