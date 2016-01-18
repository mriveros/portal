
<%@page import="py.org.presidencia.UserRole"%>
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index">Listado de Usuario</g:link></li>
				<li><g:link class="create" action="create">Crear Usuario</g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Nombre de Usuario" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.institucion?.id}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="user.institucion.label" default="Instituci&oacute;n" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label">${userInstance.institucion.nombre}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Cuenta Expirada" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label">${PresidenciaService.getBooleanDescp(userInstance?.accountExpired)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Cuenta bloqueada" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label">${PresidenciaService.getBooleanDescp(userInstance?.accountLocked)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label">${PresidenciaService.getBooleanDescp(userInstance?.enabled)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Contrase&ntilde;a Expirada" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label">${PresidenciaService.getBooleanDescp(userInstance?.passwordExpired)}</span>
					
				</li>
				</g:if>
				
			</ol>
			<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"  id="data-table-list">
								<thead>
		
									<tr>
									
										<th><g:message code="rol.name.label" default="Roles" /></th>
									
									</tr>
									</thead>
									<tbody>
									<g:each in="${UserRole.findAllByUser(userInstance)?.role}" status="i" var="rolInstance">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'} col-md-3">
										
											<td>${fieldValue(bean: rolInstance, field: "name")}</td>
										
										</tr>
									</g:each>
									</tbody>
								</table>
							</div>
						</div>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
