<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#create-user" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					Listado de Usuario
				</g:link></li>
		</ul>
	</div>
	<div id="create-user" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>	
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:set var="listaDeRoles" value="${py.org.presidencia.Role.list()}"></g:set>
		<g:form url="[resource:userInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form" />
				<div class="fieldcontain  ">
					<label for="roles">Lista de Roles</label> 
					<select size="5" class="multi" name="roles" id="roles" multiple style="width: 200px;height: 70px;">

						<g:each in="${ listaDeRoles }" var="rol">

							<option value="${ rol.id }">
								${ rol.name }
							</option>

						</g:each>

					</select> <br /> <br />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
	
</body>
</html>
