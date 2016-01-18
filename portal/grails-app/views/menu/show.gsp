
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Menu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-menu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-menu" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list menu">
			
				<g:if test="${menuInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="menu.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${menuInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="menu.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label">${PresidenciaService.getBooleanDescp(menuInstance?.activo)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${menuInstance?.idioma}">
				<li class="fieldcontain">
					<span id="idioma-label" class="property-label"><g:message code="menu.idioma.label" default="Idioma" /></span>
					
						<span class="property-value" aria-labelledby="idioma-label"><g:link controller="idioma" action="show" id="${menuInstance?.idioma?.id}">${menuInstance?.idioma?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuInstance?.subMenus}">
				<li class="fieldcontain">
					<span id="subMenus-label" class="property-label"><g:message code="menu.subMenus.label" default="Sub Menus" /></span>
					
						<g:each in="${menuInstance.subMenus}" var="s">
						<span class="property-value" aria-labelledby="subMenus-label"><g:link controller="subMenu" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:menuInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${menuInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
