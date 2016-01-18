<%@ page import="py.org.presidencia.Pagina"%>
<script type="text/javascript"
	src="${resource(dir:'js/ckeditor',file:'ckeditor.js')}"></script>
<script type="text/javascript"
	src="${resource(dir:'js',file:'jquery.js')}"></script>
<script type="text/javascript"
	src="${resource(dir:'js/tinymce',file:'tinymce.min.js')}"></script>

<script type="text/javascript">

<%--$(document).ready(function() {--%>
<%--	CKEDITOR.replace('subTitulo');--%>
<%--	CKEDITOR.replace('cuerpo');--%>
<%--	setTimeout(function(){--%>
<%--		$("#cke_cuerpo").css("margin-top","30px");--%>
<%--		$("#cke_subTitulo").css("margin-top","30px");--%>
<%--		},500);--%>
<%--	--%>
<%--});--%>
</script>

<script type="text/javascript">
	$('document').ready(function(){
		 tinymce.init({
			 selector: "#subTitulo",
			 language: "es",
			 theme: "modern",
			 plugins: [
			           "advlist autolink lists link image charmap print preview hr anchor pagebreak",
			           "searchreplace wordcount visualblocks visualchars code fullscreen",
			           "insertdatetime media nonbreaking save table contextmenu directionality",
			           "emoticons template paste textcolor colorpicker textpattern imagetools"
			       ],
		        toolbar1: " bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
		        toolbar2: " bullist numlist | outdent indent blockquote | undo redo | insertdatetime preview | forecolor backcolor | link image",
		        toolbar3: " table | hr removeformat | subscript superscript | charmap emoticons | fullscreen | ltr rtl insertfile",

		        menubar: false,
		        toolbar_items_size: 'small',
		        image_advtab: true
		        
			 });
	     tinymce.init({
		 selector: "#cuerpo",
		 language: "es",
		 theme: "modern",
		 plugins: [
		           "advlist autolink lists link image charmap print preview hr anchor pagebreak",
		           "searchreplace wordcount visualblocks visualchars code fullscreen",
		           "insertdatetime media nonbreaking save table contextmenu directionality",
		           "emoticons template paste textcolor colorpicker textpattern imagetools"
		       ],
	        toolbar1: " bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
	        toolbar2: " bullist numlist | outdent indent blockquote | undo redo | insertdatetime preview | forecolor backcolor | link image",
	        toolbar3: " table | hr removeformat | subscript superscript | charmap emoticons | fullscreen | ltr rtl insertfile",

	        menubar: false,
	        toolbar_items_size: 'small',
	        image_advtab: true
		 });
	});
</script>

<%--<div class="div-row" >--%>
<%--	<div class="div-cell div-cell-tamanho">--%>
<%--	<label for="tipo_pagina">--%>
<%--		<g:message code="pagina.tipo.pagina.label" default="Tipo pagina" />--%>
<%--	</label>--%>
<%--	</div>--%>
<%--	<div class="div-cell" style="text-align: left; margin-left: 5px;" >--%>
<%--	<g:select  id="tip_pagina" name="tipoPagina" from="${[[tipo:'pagina',descripcion:'Página'],[tipo:'from',descripcion:'Formulario'],[tipo:'lista',descripcion:'Listado']]}" optionKey="tipo" optionValue="descripcion"/>--%>
<%--	</div>--%>
<%--</div>--%>

<div
	class="${hasErrors(bean: paginaInstance, field: 'institucion', 'error')} required div-row">
	<div class="div-cell div-cell-tamanho">
		<label for="institucion"> <g:message
				code="pagina.institucion.label" default="Institucion" />
		</label>
	</div>
	<div class="div-cell div-tamanho" style="text-align: left;">
		<g:select id="institucion" name="institucion.id"
			from="${py.org.presidencia.Institucion.list()}" optionKey="id"
			required="" value="${paginaInstance?.institucion?.id}"
			class="many-to-one" />
	</div>
</div>
<div style="margin-bottom: 30px;"
	class=" ${hasErrors(bean: paginaInstance, field: 'titulo', 'error')} required div-row">
	<div class="div-cell div-cell-tamanho">
		<label for="titulo"> <g:message code="pagina.titulo.label"
				default="Titulo" />
		</label>
	</div>
	<div class="div-cell div-tamanho">
		<g:textField name="titulo" required=""
			value="${paginaInstance?.titulo}" style="width: 98%;" />
	</div>
</div>

<div

	class="div-row ${hasErrors(bean: paginaInstance, field: 'categoria', 'error')} ">
	<div class="div-cell div-cell-tamanho">
		<label for="categoria"> <g:message
				code="noticia.categoria.label" default="Tag" />
		</label>
	</div>
	<div class="div-cell div-tamanho text-left">
		<g:select name="categoria.id" noSelection="['':'']"
			from="${py.org.presidencia.Categoria.list()}"
			optionKey="id" value="${paginaInstance?.categoria?.id}"
			class="many-to-one" />
	</div>
</div>

<div

	class=" ${hasErrors(bean: paginaInstance, field: 'subTitulo', 'error')} required div-row">
	<div class="div-cell div-cell-tamanho">
		<label for="subTitulo"> <g:message
				code="pagina.subTitulo.label" default="Sub Titulo" />
		</label>
	</div>
	<div class="div-cell div-tamanho">
		<textarea id="subTitulo" maxlength="100" name="subTitulo" rows="3"
			cols="">
			${paginaInstance?.subTitulo}
		</textarea>
	</div>
</div>

<div
	class="${hasErrors(bean: paginaInstance, field: 'cuerpo', 'error')} required div-row"
	style="margin-top: 30px;">
	<div class="div-cell div-cell-tamanho">
		<label for="cuerpo"> <g:message code="pagina.cuerpo.label"
				default="Cuerpo" />
		</label>
	</div>
	<div class="div-cell div-tamanho">
		<textarea id="cuerpo" name="cuerpo" rows="3" cols="">
			${paginaInstance?.cuerpo}
		</textarea>
	</div>
</div>



