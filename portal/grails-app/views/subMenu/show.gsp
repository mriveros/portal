
<%@page import="py.org.presidencia.Pagina"%>
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.SubMenu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subMenu.label', default: 'SubMenu')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subMenu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subMenu" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subMenu">
			
				<g:if test="${subMenuInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="subMenu.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${subMenuInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subMenuInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="subMenu.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${subMenuInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subMenuInstance?.idioma}">
				<li class="fieldcontain">
					<span id="idioma-label" class="property-label"><g:message code="subMenu.idioma.label" default="Idioma" /></span>
					
						<span class="property-value" aria-labelledby="idioma-label"><g:link controller="idioma" action="show" id="${subMenuInstance?.idioma?.id}">${subMenuInstance?.idioma?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subMenuInstance?.link}">
				<li class="fieldcontain">
					<span id="link-label" class="property-label"><g:message code="subMenu.link.label" default="Link" /></span>
					
						<span class="property-value" aria-labelledby="link-label">${Pagina.findById(subMenuInstance?.link?.toInteger())?.titulo}</span>
					
				</li>
				</g:if>
			
				<g:if test="${subMenuInstance?.menu}">
				<li class="fieldcontain">
					<span id="menu-label" class="property-label"><g:message code="subMenu.menu.label" default="Menu" /></span>
					
						<span class="property-value" aria-labelledby="menu-label"><g:link controller="menu" action="show" id="${subMenuInstance?.menu?.id}">${subMenuInstance?.menu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				<g:if test="${subMenuInstance?.entidad}">
				<li class="fieldcontain">
					<span id="menu-label" class="property-label"><g:message code="subMenu.entidad.label" default="Entidad" /></span>
					
						<span class="property-value" aria-labelledby="menu-label"><g:fieldValue bean="${subMenuInstance}" field="entidad"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${subMenuInstance?.tipo}">
				<li class="fieldcontain">
					<span id="menu-label" class="property-label"><g:message code="subMenu.entidad.label" default="Tipo de Página" /></span>
					
						<span class="property-value" aria-labelledby="menu-label">${PresidenciaService.getTipoDescripcion(subMenuInstance.tipo)}</span>
					
				</l>
				</g:if>
			
				<g:if test="${subMenuInstance?.multimedia}">
				<li class="fieldcontain">
					<span id="multimedia-label" class="property-label"><g:message code="subMenu.multimedia.label" default="Multimedia" /></span>
					
						<g:each in="${subMenuInstance.multimedia}" var="m">
						<span class="property-value" aria-labelledby="multimedia-label"><g:link controller="multimedia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${subMenuInstance?.ventana}">
				<li class="fieldcontain">
					<span id="ventana-label" class="property-label"><g:message code="subMenu.ventana.label" default="Ventana" /></span>
					
						<span class="property-value" aria-labelledby="ventana-label">${PresidenciaService.getVentaDescripcion(subMenuInstance.ventana) }</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subMenuInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${subMenuInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
