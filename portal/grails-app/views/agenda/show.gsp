
<%@ page import="py.org.presidencia.Agenda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-agenda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-agenda" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list agenda">
			
				<g:if test="${agendaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="agenda.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${agendaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${agendaInstance?.lugar}">
				<li class="fieldcontain">
					<span id="lugar-label" class="property-label"><g:message code="agenda.lugar.label" default="Lugar" /></span>
					
						<span class="property-value" aria-labelledby="lugar-label"><g:fieldValue bean="${agendaInstance}" field="lugar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agendaInstance?.hora}">
				<li class="fieldcontain">
					<span id="hora-label" class="property-label"><g:message code="agenda.hora.label" default="Hora" /></span>
					
						<span class="property-value" aria-labelledby="hora-label"><g:formatDate date="${agendaInstance?.hora}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${agendaInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="agenda.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${agendaInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agendaInstance?.subTitulo}">
				<li class="fieldcontain">
					<span id="subTitulo-label" class="property-label"><g:message code="agenda.subTitulo.label" default="Sub Titulo" /></span>
					
						<span class="property-value" aria-labelledby="subTitulo-label"><g:fieldValue bean="${agendaInstance}" field="subTitulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agendaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="agenda.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${agendaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${agendaInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="agenda.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${agendaInstance?.categoria?.id}">${agendaInstance?.categoria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${agendaInstance?.institucion}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="agenda.institucion.label" default="Institucion" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label"><g:link controller="institucion" action="show" id="${agendaInstance?.institucion?.id}">${agendaInstance?.institucion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:agendaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${agendaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
