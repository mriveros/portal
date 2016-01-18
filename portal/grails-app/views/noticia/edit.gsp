<%@ page import="py.org.presidencia.Noticia"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'noticia.label', default: 'Noticia')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<script type="text/javascript"
	src="${resource(dir:'js',file:'jquery-1.3.2.js')}"></script>
</head>
<body>
	<a href="#edit-noticia" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="edit-noticia" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${noticiaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${noticiaInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource:noticiaInstance, action:'update']" method="PUT">
			<g:hiddenField name="version" value="${noticiaInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit onclick="cambiarDatos();" class="save"
					action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:form>
	</div>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#hora_day").hide();
			$("#hora_month").hide();
			$("#hora_year").hide();
		});
		
		function cambiarDatos() {
			$("#hora_day").val($("#fecha_day").val());
			$("#hora_month").val($("#fecha_month").val());
			$("#hora_year").val($("#fecha_year").val());
			return false;
		}
	</script>
</body>
</html>
