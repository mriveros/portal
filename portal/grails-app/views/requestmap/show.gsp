
<%@ page import="py.org.presidencia.Requestmap" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Requestmap')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requestmap" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requestmap" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requestmap">
			
				<g:if test="${requestmapInstance?.configAttribute}">
				<li class="fieldcontain">
					<span id="configAttribute-label" class="property-label"><g:message code="requestmap.configAttribute.label" default="Config Attribute" /></span>
					
						<span class="property-value" aria-labelledby="configAttribute-label"><g:fieldValue bean="${requestmapInstance}" field="configAttribute"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requestmapInstance?.httpMethod}">
				<li class="fieldcontain">
					<span id="httpMethod-label" class="property-label"><g:message code="requestmap.httpMethod.label" default="Http Method" /></span>
					
						<span class="property-value" aria-labelledby="httpMethod-label"><g:fieldValue bean="${requestmapInstance}" field="httpMethod"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requestmapInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="requestmap.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${requestmapInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:requestmapInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${requestmapInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
