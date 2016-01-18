<%@ page import="py.org.presidencia.Servicio" %>



<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="servicio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${servicioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="servicio.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${servicioInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="servicio.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institucion" name="institucion.id" from="${py.org.presidencia.Institucion.list()}" optionKey="id" required="" value="${servicioInstance?.institucion?.id}" class="many-to-one"/>

</div>

