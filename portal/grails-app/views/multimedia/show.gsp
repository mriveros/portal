
<%@ page import="py.org.presidencia.Multimedia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'multimedia.label', default: 'Multimedia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-multimedia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-multimedia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list multimedia">
			
				<g:if test="${multimediaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="multimedia.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${multimediaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.contenido}">
				<li class="fieldcontain">
					<span id="contenido-label" class="property-label"><g:message code="multimedia.contenido.label" default="Contenido" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.imagenPorDefecto}">
				<li class="fieldcontain">
					<span id="imagenPorDefecto-label" class="property-label"><g:message code="multimedia.imagenPorDefecto.label" default="Imagen Por Defecto" /></span>
					
						<span class="property-value" aria-labelledby="imagenPorDefecto-label"><g:formatBoolean boolean="${multimediaInstance?.imagenPorDefecto}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.agendas}">
				<li class="fieldcontain">
					<span id="agendas-label" class="property-label"><g:message code="multimedia.agendas.label" default="Agendas" /></span>
					
						<g:each in="${multimediaInstance.agendas}" var="a">
						<span class="property-value" aria-labelledby="agendas-label"><g:link controller="agenda" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.noticias}">
				<li class="fieldcontain">
					<span id="noticias-label" class="property-label"><g:message code="multimedia.noticias.label" default="Noticias" /></span>
					
						<g:each in="${multimediaInstance.noticias}" var="n">
						<span class="property-value" aria-labelledby="noticias-label"><g:link controller="noticia" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${multimediaInstance?.subMenus}">
				<li class="fieldcontain">
					<span id="subMenus-label" class="property-label"><g:message code="multimedia.subMenus.label" default="Sub Menus" /></span>
					
						<g:each in="${multimediaInstance.subMenus}" var="s">
						<span class="property-value" aria-labelledby="subMenus-label"><g:link controller="subMenu" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:multimediaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${multimediaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
