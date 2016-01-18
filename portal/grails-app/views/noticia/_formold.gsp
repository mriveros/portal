<%@ page import="py.org.presidencia.Noticia" %>



<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="noticia.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${noticiaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'hora', 'error')} required">
	<label for="hora">
		<g:message code="noticia.hora.label" default="Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="hora" precision="minute"  value="${noticiaInstance?.hora}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="noticia.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" maxlength="100" required="" value="${noticiaInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'subTitulo', 'error')} required">
	<label for="subTitulo">
		<g:message code="noticia.subTitulo.label" default="Sub Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subTitulo" required="" value="${noticiaInstance?.subTitulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="noticia.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${noticiaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'permanente', 'error')} ">
	<label for="permanente">
		<g:message code="noticia.permanente.label" default="Permanente" />
		
	</label>
	<g:checkBox name="permanente" value="${noticiaInstance?.permanente}" />

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'destacado', 'error')} ">
	<label for="destacado">
		<g:message code="noticia.destacado.label" default="Destacado" />
		
	</label>
	<g:checkBox name="destacado" value="${noticiaInstance?.destacado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'slider', 'error')} ">
	<label for="slider">
		<g:message code="noticia.slider.label" default="Slider" />
		
	</label>
	<g:checkBox name="slider" value="${noticiaInstance?.slider}" />

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="noticia.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institucion" name="institucion.id" from="${py.org.presidencia.Institucion.list()}" optionKey="id" required="" value="${noticiaInstance?.institucion?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noticiaInstance, field: 'multimedias', 'error')} ">
	<label for="multimedias">
		<g:message code="noticia.multimedias.label" default="Multimedias" />
		
	</label>
	<g:select noSelection="['':'']" name="multimedias" from="${py.org.presidencia.Multimedia.list()}" multiple="multiple" optionKey="id" size="5" value="${noticiaInstance?.multimedias*.id}" class="many-to-many"/>

</div>


