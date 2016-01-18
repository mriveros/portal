
<%@page import="py.org.presidencia.PresidenciaService"%>
<%@ page import="py.org.presidencia.Noticia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'noticia.label', default: 'Noticia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-noticia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-noticia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list noticia">
			
				<g:if test="${noticiaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="noticia.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${noticiaInstance?.fecha}" format="dd/MM/yyyy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${noticiaInstance?.hora}">
				<li class="fieldcontain">
					<span id="hora-label" class="property-label"><g:message code="noticia.hora.label" default="Hora" /></span>
					
						<span class="property-value" aria-labelledby="hora-label"><g:formatDate date="${noticiaInstance?.hora}" format="HH:mm" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${noticiaInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="noticia.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label">${noticiaInstance.titulo.encodeAsRaw()} </span>
					
				</li>
				</g:if>
				
				<g:if test="${noticiaInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="noticia.categoria.label" default="Tag" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:fieldValue bean="${noticiaInstance}" field="categoria"/></span>
					
				</li>
				</g:if>

			
				<g:if test="${noticiaInstance?.subTitulo}">
				<li class="fieldcontain">
					<span id="subTitulo-label" class="property-label"><g:message code="noticia.subTitulo.label" default="Sub Titulo" /></span>
					
						<span class="property-value" aria-labelledby="subTitulo-label">${noticiaInstance.subTitulo.encodeAsRaw()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${noticiaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="noticia.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label">${noticiaInstance.descripcion.encodeAsRaw()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${noticiaInstance?.permanente}">
				<li class="fieldcontain">
					<span id="permanente-label" class="property-label"><g:message code="noticia.permanente.label" default="Permanente" /></span>
					
						<span class="property-value" aria-labelledby="permanente-label"><g:if test="${noticiaInstance?.permanente}">Si</g:if><g:else>No</g:else> </span>
					
				</li>
				</g:if>
			
				<g:if test="${noticiaInstance?.destacado}">
				<li class="fieldcontain">
					<span id="destacado-label" class="property-label"><g:message code="noticia.destacado.label" default="Destacado" /></span>
					
						<span class="property-value" aria-labelledby="destacado-label"><g:if test="${noticiaInstance.destacado}">Si</g:if><g:else>No</g:else></span>
					
				</li>
				</g:if>
				
				<g:if test="${noticiaInstance?.slider}">
				<li class="fieldcontain">
					<span id="slider-label" class="property-label"><g:message code="noticia.slider.label" default="Slider" /></span>
					
						<span class="property-value" aria-labelledby="slider-label"><g:if test="${noticiaInstance.slider}">Si</g:if><g:else>No</g:else></span>
					
				</li>
				</g:if>
			
				<g:if test="${noticiaInstance?.institucion}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="noticia.institucion.label" default="Institucion" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label"><g:link controller="institucion" action="show" id="${noticiaInstance?.institucion?.id}">${noticiaInstance?.institucion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${noticiaInstance?.multimedias}">
				<li class="fieldcontain">
					<span id="multimedias-label" class="property-label"><g:message code="noticia.multimedias.label" default="Multimedias" /></span>
					
						<g:each in="${noticiaInstance.multimedias}" var="m">
						<span class="property-value" aria-labelledby="multimedias-label"><g:link controller="multimedia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:noticiaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${noticiaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
