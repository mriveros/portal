<%@page import="org.codehaus.groovy.grails.commons.GrailsApplication"%>
<%@ page import="py.org.presidencia.Role"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'role.label', default: 'Role')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<link type="text/css" rel="stylesheet" href="${resource(dir:'css',file:'multi-select.css')}">

</head>
<body>
	<a href="#edit-role" class="skip" tabindex="-1"><g:message
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
	<div id="edit-role" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
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
		<g:set var="listaDePermiso" value="${permisosExistentes}"></g:set>
		<g:form url="[resource:roleInstance, action:'update']" method="PUT">
			<g:hiddenField name="version" value="${roleInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
				<div class="fieldcontain">
					<label for="permisos"> <g:message code="rol.permiso.label"
							default="Permiso" />
					</label> 
					 <select class="multi" name= "permisos" id="permisos" multiple>
					 	<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<ul>
								 <g:each var="uri" in="${c.getURIs()}">
									<g:if test="${uri.indexOf('*') != -1}">
										<g:if test="${py.org.presidencia.Requestmap.find("FROM Requestmap WHERE configAttribute like '%${roleInstance.authority}%' AND url='${uri}'")}">
				   							
				   							<g:if test="${c.getMethodActionName(uri) == 'show'}">
												<option value=${uri} selected> Ver ${c.logicalPropertyName} </option>
			                       	    	</g:if>
			                       	    	<g:elseif test="${c.getMethodActionName(uri) == 'index'}">
												<option value=${uri} selected> Listar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	    	<g:elseif test="${c.getMethodActionName(uri) == 'create'}">
												<option value=${uri} selected> Crear ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                      	    <g:elseif test="${c.getMethodActionName(uri) == 'edit'}">
												<option value=${uri} selected> Editar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'start'}">
										        <option value=${uri} selected> Iniciar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'procesarMarcacion'}">
				                       	       <option value=${uri} selected> Procesar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'registrarSolicitud'}">
				                       	       <option value=${uri} selected> Registrar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'listaSolicitudes'}">
				                       	       <option value=${uri} selected> Lista ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'update'}">
										       <option value=${uri} selected> Actualizar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	        <g:elseif test="${c.getMethodActionName(uri) == 'save'}">
										       <option value=${uri} selected> Guardar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	     	<g:elseif test="${c.getMethodActionName(uri) == 'consolidarHoras'}">
										       <option value=${uri} selected> Consolidar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	     	<g:elseif test="${c.getMethodActionName(uri) == 'cierrePeriodo'}">
										       <option value=${uri} selected> Cerrar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	     	<g:elseif test="${c.getMethodActionName(uri) == 'archivoHacienda'}">
										       <option value=${uri} selected> Archivo Hacienda ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	     	<g:elseif test="${c.getMethodActionName(uri) == 'aprobarSueldo'}">
										       <option value=${uri} selected> Aprobar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	     	<g:elseif test="${c.getMethodActionName(uri) == 'revaluo'}">
										       <option value=${uri} selected> Revaluo ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	     	<g:elseif test="${c.getMethodActionName(uri) == 'showConfig'}">
												<option value=${uri} selected> Mostrar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	        <g:elseif test="${c.logicalPropertyName == 'reportes'}">
										       <option value=${uri} selected> ${c.getMethodActionName(uri)} </option>
			                       	    	</g:elseif>
			                       	   		<g:elseif test="${c.getMethodActionName(uri) == 'delete'}">
										       <option value=${uri} selected> Eliminar ${c.logicalPropertyName} </option>
			                       	     	</g:elseif>
			                       	     	<g:else>
			                       	    	   <option value=${uri} selected>${c.logicalPropertyName} ${c.getMethodActionName(uri)}</option>
			                       	    	</g:else>				
					  					</g:if>

					  					<g:else>
					  						<g:if test="${c.getMethodActionName(uri) == 'show'}">
									       		<option value=${uri}> Ver ${c.logicalPropertyName} </option>
			                       	    	</g:if>
			                       	    	<g:elseif test="${c.getMethodActionName(uri) == 'index'}">
				                       	       <option value=${uri}> Listar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
					                  	    <g:elseif test="${c.getMethodActionName(uri) == 'create'}">
										       <option value=${uri}> Crear ${c.logicalPropertyName} </option>
			                       	        </g:elseif>
			                      	        <g:elseif test="${c.getMethodActionName(uri) == 'edit'}">
												<option value=${uri}> Editar ${c.logicalPropertyName} </option>
			                       	        </g:elseif>
			                       	        <g:elseif test="${c.getMethodActionName(uri) == 'start'}">
										       <option value=${uri}> Iniciar ${c.logicalPropertyName} </option>
			                       	        </g:elseif>
			                       	        <g:elseif test="${c.getMethodActionName(uri) == 'procesarMarcacion'}">
										       <option value=${uri}> Procesar ${c.logicalPropertyName} </option>
			                       	    	</g:elseif>
			                       	    	<g:elseif test="${c.getMethodActionName(uri) == 'registrarSolicitud'}">
												<option value=${uri}> Registrar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'listaSolicitudes'}">
												<option value=${uri}> Lista ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'update'}">
										       <option value=${uri}> Actualizar ${c.logicalPropertyName} </option>
				                 	 	    </g:elseif>
				                            <g:elseif test="${c.getMethodActionName(uri) == 'save'}">
											   <option value=${uri}> Guardar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'consolidarHoras'}">
										       <option value=${uri}> Consolidar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'cierrePeriodo'}">
												<option value=${uri}> Cerrar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'archivoHacienda'}">
												<option value=${uri}> Archivo Hacienda ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'aprobarSueldo'}">
										       <option value=${uri}> Aprobar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'revaluo'}">
										       <option value=${uri}> Revaluo ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.getMethodActionName(uri) == 'showConfig'}">
										       <option value=${uri}> Mostrar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
				                       	    <g:elseif test="${c.logicalPropertyName == 'reportes'}">
										    	<option value=${uri}> ${c.getMethodActionName(uri)} </option>
				                       	    </g:elseif>
				                       	   	<g:elseif test="${c.getMethodActionName(uri) == 'delete'}">
											    <option value=${uri}> Eliminar ${c.logicalPropertyName} </option>
				                       	    </g:elseif>
						  					<g:else>
				                       	    	<option value=${uri}>${c.logicalPropertyName} ${c.getMethodActionName(uri)}</option>
				                       	    </g:else>			
						  				
						  				</g:else>
					  				</g:if>
			                     </g:each>
			                </ul>
						  </g:each>	
					 </select>
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
		$('#permisos').multiSelect({
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

		$("#ms-permisos").css('margin-left','26%');
		});
	
	$('#permisos').append($('<option/>').attr('value','/administracion/*').text('Administracion'));
	</script>
</body>
</html>
