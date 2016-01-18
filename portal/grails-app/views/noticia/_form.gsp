<%@ page import="py.org.presidencia.Noticia"%>
<script type="text/javascript"
	src="${resource(dir:'js/ckeditor',file:'ckeditor.js')}"></script>
<script type="text/javascript"
	src="${resource(dir:'js',file:'jquery.js')}"></script>
<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace('subTitulo');
		CKEDITOR.replace('descripcion');
		setTimeout(function() {
			$("#cke_cuerpo").css("margin-top", "30px");
			$("#cke_descripcion").css("margin-top", "30px");
		}, 500);

	});
</script>


<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'fecha', 'error')} required">
	<div class="div-cell div-cell-tamanho">
		<label for="fecha"> <g:message code="noticia.fecha.label"
				default="Fecha" /> <span class="required-indicator">*</span>
		</label>
	</div>
	<div class="div-cell text-left">
		<g:datePicker name="fecha" precision="day"
			value="${noticiaInstance?.fecha}" />
	</div>
</div>

<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'hora', 'error')} required">
	<div class="div-cell div-cell-tamanho">
		<label for="hora"> <g:message code="noticia.hora.label"
				default="Hora" /> <span class="required-indicator">*</span>
		</label>
	</div>
	<div class="div-cell text-left" >
		<g:datePicker name="hora" precision="minute"
			value="${noticiaInstance?.hora}" />
	</div>

</div>


<div style="margin-bottom: 30px;"
	class=" ${hasErrors(bean: noticiaInstance, field: 'titulo', 'error')} required div-row">
	<div class="div-cell div-cell-tamanho">
		<label for="titulo"> <g:message code="noticia.titulo.label"
				default="Titulo" />
		</label>
	</div>
	<div class="div-cell div-tamanho">
		<g:textField name="titulo" required=""
			value="${noticiaInstance?.titulo}" style="width: 98%;" />
	</div>
</div>

<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'categoria', 'error')} ">
	<div class="div-cell div-cell-tamanho">
		<label for="categoria"> <g:message
				code="noticia.categoria.label" default="Tag" />
		</label>
	</div>
	<div class="div-cell div-tamanho text-left">
		<g:select name="categoria.id" noSelection="['':'']"
			from="${py.org.presidencia.Categoria.list()}"
			optionKey="id" value="${noticiaInstance?.categoria?.id}"
			class="many-to-one" />
	</div>
</div>

<div
	class=" ${hasErrors(bean: noticiaInstance, field: 'subTitulo', 'error')} required div-row">
	<div class="div-cell div-cell-tamanho">
		<label for="subTitulo"> <g:message
				code="noticia.subTitulo.label" default="Sub Titulo" />
		</label>
	</div>
	<div class="div-cell div-tamanho">
		<textarea id="subTitulo" maxlength="100" name="subTitulo" rows="3"
			cols="">
			${noticiaInstance?.subTitulo}
		</textarea>
	</div>
</div>

<div
	class="${hasErrors(bean: paginaInstance, field: 'cuerpo', 'error')} required div-row"
	style="margin-top: 30px;">
	<div class="div-cell div-cell-tamanho">
		<label for="descripcion"> <g:message
				code="pagina.descripcion.label" default="Descripcion" />
		</label>
	</div>
	<div class="div-cell div-tamanho">
		<textarea id="descripcion" name="descripcion" rows="3" cols="">
			${noticiaInstance?.descripcion}
		</textarea>
	</div>
</div>

<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'permanente', 'error')} ">
	<div class="div-cell div-cell-tamanho">
		<label for="permanente"> <g:message
				code="noticia.permanente.label" default="Permanente" />

		</label>
	</div>
	<div class="div-cell div-tamanho text-left">
		<g:checkBox name="permanente" value="${noticiaInstance?.permanente}" />
	</div>
</div>
<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'destacado', 'error')} ">
	<div class="div-cell div-cell-tamanho">
		<label for="destacado"> <g:message
				code="noticia.destacado.label" default="Destacado" />

		</label>
	</div>
	<div class="div-cell div-tamanho text-left">
		<g:checkBox name="destacado" value="${noticiaInstance?.destacado}" />
	</div>
</div>
<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'slider', 'error')} ">
	<div class="div-cell div-cell-tamanho">
		<label for="slider"> <g:message code="noticia.slider.label"
				default="Slider" />

		</label>
	</div>
	<div class="div-cell div-tamanho text-left">
		<g:checkBox name="slider" value="${noticiaInstance?.slider}" />
	</div>
</div>
<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'institucion', 'error')} ">
	<div class="div-cell div-cell-tamanho">
		<label for="institucion"> <g:message
				code="noticia.institucion.label" default="Institucion" /> <span
			class="required-indicator">*</span>
		</label>
	</div>
	<div class="div-cell div-tamanho text-left">
		<g:select id="institucion" name="institucion.id"
			from="${py.org.presidencia.Institucion.list()}" optionKey="id"
			required="" value="${noticiaInstance?.institucion?.id}"
			class="many-to-one" />
	</div>
</div>
<div
	class="div-row ${hasErrors(bean: noticiaInstance, field: 'multimedias', 'error')} ">
	<div class="div-cell div-cell-tamanho">
		<label for="institucion"> <g:message
				code="noticia.multimedias.label" default="Multimedias" /> <span
			class="required-indicator">*</span>
		</label>
	</div>
	<div class="div-cell div-tamanho text-left">
		<g:select noSelection="['':'']" name="multimedias"
			from="${py.org.presidencia.Multimedia.list()}" multiple="multiple"
			optionKey="id" size="5" value="${noticiaInstance?.multimedias*.id}"
			class="many-to-many" />
	</div>
</div>


<<<<<<< HEAD


=======
>>>>>>> e87598af8cbe6d0c606dd8ae2e160652808831c4
