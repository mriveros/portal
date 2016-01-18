
<%@ page import="py.org.presidencia.Configuracion"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'configuracion.label', default: 'Configuracion')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-configuracion" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-configuracion" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list configuracion">

			<g:if test="${configuracionInstance?.host}">
				<li class="fieldcontain"><span id="host-label"
					class="property-label"><g:message
							code="configuracion.host.label" default="Host" /></span> <span
					class="property-value" aria-labelledby="host-label"><g:fieldValue
							bean="${configuracionInstance}" field="host" /></span></li>
			</g:if>

			<g:if test="${configuracionInstance?.usuario}">
				<li class="fieldcontain"><span id="usuario-label"
					class="property-label"><g:message
							code="configuracion.usuario.label" default="Usuario" /></span> <span
					class="property-value" aria-labelledby="usuario-label"><g:fieldValue
							bean="${configuracionInstance}" field="usuario" /></span></li>
			</g:if>
			
			<g:if test="${configuracionInstance?.port}">
				<li class="fieldcontain"><span id="usuario-label"
					class="property-label"><g:message
							code="configuracion.usuario.label" default="Puerto" /></span> <span
					class="property-value" aria-labelledby="usuario-label"><g:fieldValue
							bean="${configuracionInstance}" field="port" /></span></li>
			</g:if>

			<%--				<g:if test="${configuracionInstance?.password}">--%>
			<%--				<li class="fieldcontain">--%>
			<%--					<span id="password-label" class="property-label"><g:message code="configuracion.password.label" default="Password" /></span>--%>
			<%--					--%>
			<%--						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${configuracionInstance}" field="password"/></span>--%>
			<%--					--%>
			<%--				</li>--%>
			<%--				</g:if>--%>

			<g:if test="${configuracionInstance?.cantAgendaPag}">
				<li class="fieldcontain"><span id="cantAgendaPag-label"
					class="property-label"><g:message
							code="configuracion.cantAgendaPag.label"
							default="Cant. Reg. a mostar(Agenda)" /></span> <span
					class="property-value" aria-labelledby="cantAgendaPag-label"><g:fieldValue
							bean="${configuracionInstance}" field="cantAgendaPag" /></span></li>
			</g:if>

			<g:if test="${configuracionInstance?.cantNoticiaPag}">
				<li class="fieldcontain"><span id="cantNoticiaPag-label"
					class="property-label"><g:message
							code="configuracion.cantNoticiaPag.label"
							default="Cant. Reg. a mostar(Noticia)" /></span> <span
					class="property-value" aria-labelledby="cantNoticiaPag-label"><g:fieldValue
							bean="${configuracionInstance}" field="cantNoticiaPag" /></span></li>
			</g:if>

			<g:if test="${configuracionInstance?.cantPagina}">
				<li class="fieldcontain"><span id="cantPagina-label"
					class="property-label"><g:message
							code="configuracion.cantPagina.label"
							default="Cant. Reg. a Mostar (Pagina)" /></span> <span
					class="property-value" aria-labelledby="cantPagina-label"><g:fieldValue
							bean="${configuracionInstance}" field="cantPagina" /></span></li>
			</g:if>
			<g:if test="${userInstance?.accountExpired}">
				<li class="fieldcontain"><span id="accountExpired-label"
					class="property-label"><g:message
							code="user.accountExpired.label" default="Cuenta Expirada" /></span> <span
					class="property-value" aria-labelledby="accountExpired-label">
						${PresidenciaService.getBooleanDescp(userInstance?.accountExpired)}
				</span></li>
			</g:if>

		</ol>
		<g:form url="[resource:configuracionInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit"
					resource="${configuracionInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
