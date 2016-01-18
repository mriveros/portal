<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'role.label', default: 'Role')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#create-role" class="skip" tabindex="-1"><g:message
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
	<div id="create-role" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${roleInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${roleInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource:roleInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form" />
				<div class="fieldcontain">
					<label for="permisos"> <g:message
							code="rol.permiso.label" default="Permiso" />
					</label> <select class="multi" name="permisos" id="permisos" multiple>

						<g:each var="c"
							in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<ul>

								<g:each var="uri" in="${c.getURIs()}">

									<g:if test="${uri.indexOf('*') != -1}">

										<g:if test="${c.getMethodActionName(uri) == 'show'}">

											<option value=${uri}>Ver
												${c.logicalPropertyName}
											</option>
										</g:if>
										<g:elseif test="${c.getMethodActionName(uri) == 'index'}">

											<option value=${uri}>Listar
												${c.logicalPropertyName}
											</option>
										</g:elseif>
										<g:elseif test="${c.getMethodActionName(uri) == 'create'}">

											<option value=${uri}>Crear
												${c.logicalPropertyName}
											</option>
										</g:elseif>
										<g:elseif test="${c.getMethodActionName(uri) == 'edit'}">

											<option value=${uri}>Editar
												${c.logicalPropertyName}
											</option>
										</g:elseif>

										<g:elseif test="${c.getMethodActionName(uri) == 'update'}">

											<option value=${uri}>Actualizar
												${c.logicalPropertyName}
											</option>
										</g:elseif>
										<g:elseif test="${c.getMethodActionName(uri) == 'save'}">

											<option value=${uri}>Guardar
												${c.logicalPropertyName}
											</option>
										</g:elseif>

										<g:elseif test="${c.getMethodActionName(uri) == 'delete'}">

											<option value=${uri}>Eliminar
												${c.logicalPropertyName}
											</option>
										</g:elseif>

										<g:else>
											<option value=${uri}>
												${c.logicalPropertyName}
												${c.getMethodActionName(uri)}
											</option>
										</g:else>


									</g:if>
								</g:each>

							</ul>
						</g:each>

					</select>
				</div>

			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){$('#permisos').append($('<option/>').attr('value','/administracion/*').text('Administracion') )});
	</script>
</body>
</html>
