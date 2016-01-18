<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'pagina.label', default: 'Pagina')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<%--<script type="text/javascript">--%>
<%--	function getCKE() {--%>
<%--		var objEditor = CKEDITOR.instances["cuerpo"];--%>
<%--		var data = objEditor.getData();--%>
<%--		$('#cuerpo').val(data);--%>
<%--		objEditor = CKEDITOR.instances["subTitulo"];--%>
<%--		data = objEditor.getData();--%>
<%--		$('#subTitulo').val(data);--%>
<%--		$("#frm-principal").submit();--%>
<%--	}--%>
<%--</script>--%>

</head>
<body>
	<a href="#create-pagina" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-pagina" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${paginaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${paginaInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form id="frm-principal"url="[resource:paginaInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
<%--				<input id="create" class="save" type="button" name="create"--%>
<%--					value="Crear" onclick="getCKE();">--%>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
