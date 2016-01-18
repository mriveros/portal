<%@ page import="py.org.presidencia.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<link type="text/css" rel="stylesheet" href="${resource(dir:'css',file:'multi-select.css')}">
</head>
<body>
	<a href="#edit-user" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					Listado de Usuario
				</g:link></li>
			<li><g:link class="create" action="create">
					Crear Usuario
				</g:link></li>
		</ul>
	</div>
	<div id="edit-user" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
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
				<g:set var="listaDeRolesAsignados"
					value="${userInstance.getAuthorities()}"></g:set>
		<g:form url="[resource:userInstance, action:'update']" method="PUT">
			<g:hiddenField name="version" value="${userInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
				
				<div class="fieldcontain">
					<label for="roles">Lista de Roles</label> <select class="multi"
						name="roles" id="roles" multiple>

						<g:each in="${ listaDeRoles }" var="rol">
							<g:if test="${rol in listaDeRolesAsignados}">

								<option value="${ rol.id }" selected>
									${ rol.name }
								</option>

							</g:if>
							<g:else>

								<option value="${ rol.id }">
									${ rol.name }
								</option>

							</g:else>
						</g:each>

					</select> <br /> <br />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:form>
	</div>
	<script type="text/javascript" src="${resource(dir:'js',file:"jquery.multi-select.js")}"> </script>
	<script type="text/javascript" src="${resource(dir:'js',file:"jquery.quicksearch.js")}"> </script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#roles').multiSelect({
			  selectableHeader: "<input type='text' class='search-input' autocomplete='off' >",
			  selectionHeader: "<input type='text' class='search-input' autocomplete='off' >",
			  afterInit: function(ms){
			    var that = this,
			        $selectableSearch = that.$selectableUl.prev(),
			        $selectionSearch = that.$selectionUl.prev(),
			        selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
			        selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

			    that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
			    .on('keydown', function(e){
			      if (e.which === 40){
			        that.$selectableUl.focus();
			        return false;
			      }
			    });

			    that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
			    .on('keydown', function(e){
			      if (e.which == 40){
			        that.$selectionUl.focus();
			        return false;
			      }
			    });
			  },
			  afterSelect: function(){
			    this.qs1.cache();
			    this.qs2.cache();
			  },
			  afterDeselect: function(){
			    this.qs1.cache();
			    this.qs2.cache();
			  }
			});

		$("#ms-roles").css('margin-left','26%');
		});

	</script>
</body>
</html>
