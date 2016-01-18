
<%@ page import="py.org.presidencia.Agenda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-agenda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-agenda" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'agenda.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="lugar" title="${message(code: 'agenda.lugar.label', default: 'Lugar')}" />
					
						<g:sortableColumn property="hora" title="${message(code: 'agenda.hora.label', default: 'Hora')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'agenda.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="subTitulo" title="${message(code: 'agenda.subTitulo.label', default: 'Sub Titulo')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'agenda.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${agendaInstanceList}" status="i" var="agendaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${agendaInstance.id}">${fieldValue(bean: agendaInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: agendaInstance, field: "lugar")}</td>
					
						<td><g:formatDate date="${agendaInstance.hora}" /></td>
					
						<td>${fieldValue(bean: agendaInstance, field: "titulo")}</td>
					
						<td>${fieldValue(bean: agendaInstance, field: "subTitulo")}</td>
					
						<td>${fieldValue(bean: agendaInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${agendaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
