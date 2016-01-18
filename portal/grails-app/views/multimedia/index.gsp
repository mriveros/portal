
<%@ page import="py.org.presidencia.Multimedia"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'multimedia.label', default: 'Multimedia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-multimedia" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-multimedia" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="descripcion"
						title="${message(code: 'multimedia.descripcion.label', default: 'Descripcion')}" />

					<g:sortableColumn property="contenido"
						title="${message(code: 'multimedia.contenido.label', default: 'Contenido')}" />

					<g:sortableColumn property="imagenPorDefecto"
						title="${message(code: 'multimedia.imagenPorDefecto.label', default: 'Imagen por Defecto')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${multimediaInstanceList}" status="i"
					var="multimediaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${multimediaInstance.id}">
								${fieldValue(bean: multimediaInstance, field: "descripcion")}
							</g:link></td>

						<td><img alt="" src="${multimediaInstance.getImg()}"
							style="width: 150px; height: 100px;"></td>

						<td><g:if test="${multimediaInstance.imagenPorDefecto}">
								Si
							</g:if> <g:else>
								No
							</g:else></td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${multimediaInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
