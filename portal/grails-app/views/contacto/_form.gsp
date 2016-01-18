<%@ page import="py.org.presidencia.Contacto" %>



<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="contacto.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${contactoInstance?.titulo}"/>

</div>

<%--<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'remitente', 'error')} required">--%>
<%--	<label for="remitente">--%>
<%--		<g:message code="contacto.remitente.label" default="Remitente" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:field type="email" name="remitente" required="" value="${contactoInstance?.remitente}"/>--%>
<%----%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'destinatario', 'error')} required">
	<label for="destinatario">
		<g:message code="contacto.destinatario.label" default="Destinatario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="destinatario" required="" value="${contactoInstance?.destinatario}"/>

</div>

<%--<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'correo', 'error')} required">--%>
<%--	<label for="correo">--%>
<%--		<g:message code="contacto.correo.label" default="Correo" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:textField name="correo" required="" value="${contactoInstance?.correo}"/>--%>
<%----%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="contacto.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${contactoInstance?.activo}" />

</div>

<%--<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'asunto', 'error')} ">--%>
<%--	<label for="asunto">--%>
<%--		<g:message code="contacto.asunto.label" default="Asunto" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:textField name="asunto" value="${contactoInstance?.asunto}"/>--%>
<%----%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="contacto.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institucion" name="institucion.id" from="${py.org.presidencia.Institucion.list()}" optionKey="id" required="" value="${contactoInstance?.institucion?.id}" class="many-to-one"/>

</div>

