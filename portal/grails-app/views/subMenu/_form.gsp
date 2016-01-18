<%@ page import="py.org.presidencia.SubMenu" %>



<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'tipoPagina', 'error')} required">
	<label for="titulo">
		<g:message code="subMenu.tipoPagina.label" default="Tipo de Página" />
		<span class="required-indicator">*</span>
	</label>
	<g:select onchange="mostar(this);" from="${[[tipo:0,nombre:'Página'],[tipo:1,nombre:'Listado'],[tipo:2,nombre:'Pagina con imagen a la izquierda'],[tipo:3,nombre:'Actos Administrativos']]}" name="tipo" optionKey="tipo" optionValue="nombre" value="${subMenuInstance.tipo}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="subMenu.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${subMenuInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="subMenu.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${subMenuInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'orden', 'error')} ">
	<label for="orden">
		<g:message code="subMenu.orden.label" default="Orden" />
		
	</label>
	<g:textField name="orden" required="" value="${subMenuInstance?.orden}" />

</div>

<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'idioma', 'error')} required">
	<label for="idioma">
		<g:message code="subMenu.idioma.label" default="Idioma" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="idioma" name="idioma.id" from="${py.org.presidencia.Idioma.list()}" optionKey="id" required="" value="${subMenuInstance?.idioma?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'link', 'error')} " id="pagina">
	<label for="link">
		<g:message code="subMenu.link.label" default="Pagina" />
		
	</label>
	<g:select name="link" from="${py.org.presidencia.Pagina.findAll()}" optionKey="id" optionValue="titulo" value="${subMenuInstance?.link}" />

</div>

<div id="entidad" class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'entidad', 'error')} " style="display: hidden;">
	<label for="entidad">
		<g:message code="subMenu.entidad.label" default="Entidad" />
	</label>

	<g:select name="entidad" optionKey="name" optionValue="name" from="${grailsApplication.domainClasses.sort{it.fullName}}" noSelection="['':'']" />

</div>

<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'menu', 'error')} required">
	<label for="menu">
		<g:message code="subMenu.menu.label" default="Menu" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="menu" name="menu.id" from="${py.org.presidencia.Menu.list()}" optionKey="id" required="" value="${subMenuInstance?.menu?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'multimedia', 'error')} ">
	<label for="multimedia">
		<g:message code="subMenu.multimedia.label" default="Multimedia" />
		
	</label>
	<g:select name="multimedia" from="${py.org.presidencia.Multimedia.list()}" multiple="multiple" optionKey="id" size="5" value="${subMenuInstance?.multimedia*.id}" class="many-to-many" noSelection="['':'']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subMenuInstance, field: 'ventana', 'error')} ">
	<label for="ventana">
		<g:message code="subMenu.ventana.label" default="Ventana" />
	</label>
	<g:select name="ventana" optionKey="tipo" optionValue="descripcion" from="${[[tipo:"_blank",descripcion:"Nueva Ventana"],[tipo:"_top",descripcion:"Ventana principal"],[tipo:"_self",descripcion:"Misma ventana"],[tipo:"_parent",descripcion:"Ventana padre"]]}"/>

</div>
<script type="text/javascript">
	$('document').ready(function(){
				var tipo = $("#tipo").find(":selected").val()
				if(tipo == "1"){
					$('#pagina').hide();
					$('#entidad').show();
					$('#entidad').find("option[value='${subMenuInstance.entidad}']").attr('selected','selected');
				}else if(tipo == "3" ) {
					$('#pagina').hide();
					$('#entidad').hide();

				}else{
					$('#pagina').show();
					$('#entidad').hide();
				}
				
		});

	function mostar(elem){
		var cadena = $(elem).find(':selected').val();
		if(cadena == "1"){
			$('#pagina').hide();
			$('#entidad').show();
			
		}else if(cadena == "3" ) {
			$('#pagina').hide();
			$('#entidad').hide();


		}else{
			$('#pagina').show();
			$('#entidad').hide();
		}
	}
</script>
