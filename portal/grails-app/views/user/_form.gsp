<%@page import="py.org.presidencia.Institucion"%>
<%@ page import="py.org.presidencia.User"%>



<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username"> <g:message code="user.username.label"
			default="Nombre de Usuario" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required=""
		value="${userInstance?.username}" />

</div>
<g:if test="${flash?.pass}">
	<div
		class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
		<label for="password"> <g:message code="user.password.label"
				default="Contrase&ntilde;a" /> <span class="required-indicator">*</span>
		</label>
		<g:passwordField name="password" required=""
			value="${userInstance?.password}" />

	</div>
</g:if>
	<div
		class="fieldcontain ${hasErrors(bean: userInstance, field: 'institucion', 'error')} required">
		<label for="password"> <g:message code="user.institucion.label"
				default="Institucion" /> <span class="required-indicator">*</span>
		</label>
		<g:select name="institucion.id" from="${Institucion.list()}" optionKey="id" optionValue="nombre" value="${userInstance?.institucion?.id}"/>
	</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired"> <g:message
			code="user.accountExpired.label" default="Cuenta Expirada" />

	</label>
	<g:checkBox name="accountExpired"
		value="${userInstance?.accountExpired}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked"> <g:message
			code="user.accountLocked.label" default="Cuenta Bloqueada" />

	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled"> <g:message code="user.enabled.label"
			default="Activo" />

	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired"> <g:message
			code="user.passwordExpired.label" default="Contrase&ntildea Expirada" />

	</label>
	<g:checkBox name="passwordExpired"
		value="${userInstance?.passwordExpired}" />

</div>

