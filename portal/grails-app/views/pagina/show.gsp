
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Pagina"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'pagina.label', default: 'Pagina')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-pagina" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home"
				href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					Listado de Paginas
				</g:link></li>
			<li><g:link class="create" action="create">
					Crear Pagina
				</g:link></li>
		</ul>
	</div>
	<div id="show-pagina" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<ol class="property-list configuracion">

			<g:if test="${paginaInstance?.titulo}">
				<li class="fieldcontain"><span id="cantAgendaPag-label"
					class="property-label"><g:message
							code="configuracion.cantAgendaPag.label" default="Titulo" /></span> <span
					class="property-value" aria-labelledby="cantAgendaPag-label">
						${paginaInstance.titulo.encodeAsRaw()}
				</span></li>
			</g:if>
			
			<g:if test="${paginaInstance?.categoria}">
				<li class="fieldcontain"><span id="categoria-label"
					class="property-label"><g:message
							code="pagina.categoria.label" default="Tag" /></span> <span
					class="property-value" aria-labelledby="categoria-label">
						${paginaInstance?.categoria?.descripcion}
				</span></li>
			</g:if>


			<g:if test="${paginaInstance?.subTitulo}">
				<li class="fieldcontain"><span class="property-label"><g:message
							code="configuracion.cantAgendaPag.label" default="SubTitulo" /></span>

					<span class="property-value" aria-labelledby="cantAgendaPag-label">
						${paginaInstance.subTitulo.encodeAsRaw()}
				</span></li>
			</g:if>
			<g:if test="${paginaInstance?.cuerpo}">
				<li class="fieldcontain"><span class="property-label"><g:message
							code="configuracion.cantAgendaPag.label" default="Cuerpo" /></span> <span
					class="property-value" aria-labelledby="cantAgendaPag-label">
						${paginaInstance.cuerpo.encodeAsRaw()}
				</span></li>
			</g:if>
		</ol>

		<g:form url="[resource:paginaInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${paginaInstance}">
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
