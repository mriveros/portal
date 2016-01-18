
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Institucion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institucion.label', default: 'Institucion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-institucion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-institucion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list institucion">
			
				<g:if test="${institucionInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="institucion.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${institucionInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${institucionInstance?.usuario}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="usuario-label" class="property-label"><g:message code="institucion.usuario.label" default="Usuario" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${institucionInstance?.usuario?.id}">${institucionInstance?.usuario?.encodeAsHTML()}</g:link></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${institucionInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="institucion.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label">${PresidenciaService.getBooleanDescp(institucionInstance?.activo)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${institucionInstance?.agendas}">
				<li class="fieldcontain">
					<span id="agendas-label" class="property-label"><g:message code="institucion.agendas.label" default="Agendas" /></span>
					
						<g:each in="${institucionInstance.agendas}" var="a">
						<span class="property-value" aria-labelledby="agendas-label"><g:link controller="agenda" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${institucionInstance?.contactos}">
				<li class="fieldcontain">
					<span id="contactos-label" class="property-label"><g:message code="institucion.contactos.label" default="Contactos" /></span>
					
						<g:each in="${institucionInstance.contactos}" var="c">
						<span class="property-value" aria-labelledby="contactos-label"><g:link controller="contacto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${institucionInstance?.noticias}">
				<li class="fieldcontain">
					<span id="noticias-label" class="property-label"><g:message code="institucion.noticias.label" default="Noticias" /></span>
					
						<g:each in="${institucionInstance.noticias}" var="n">
						<span class="property-value" aria-labelledby="noticias-label"><g:link controller="noticia" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${institucionInstance?.servicios}">
				<li class="fieldcontain">
					<span id="servicios-label" class="property-label"><g:message code="institucion.servicios.label" default="Servicios" /></span>
					
						<g:each in="${institucionInstance.servicios}" var="s">
						<span class="property-value" aria-labelledby="servicios-label"><g:link controller="servicio" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:institucionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${institucionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
