<%@page import="py.org.presidencia.Institucion"%>
<%@ page import="py.org.presidencia.Configuracion" %>



<div class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'host', 'error')} ">
	<label for="host">
		<g:message code="configuracion.host.label" default="Host" />
		<span class="required-indicator">*</span>
		
	</label>
	<g:textField name="host" value="${configuracionInstance?.host}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'port', 'error')} ">
	<label for="port">
		<g:message code="configuracion.host.label" default="Puerto" />
		<span class="required-indicator">*</span>
		
	</label>
	<g:textField name="port" value="${configuracionInstance?.port}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="configuracion.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
		
	</label>
	<g:textField name="usuario" value="${configuracionInstance?.usuario}" required=""/>

</div>
<%--<g:if test="${flash?.create}">--%>
<div class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="configuracion.password.label" default="Password" />
		<span class="required-indicator">*</span>
		
	</label>
	<g:passwordField name="password" value="${configuracionInstance?.password}" required=""/>
</div>
<%--</g:if>--%>
<div class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'cantAgendaPag', 'error')} required">
	<label for="cantAgendaPag">
		<g:message code="configuracion.cantAgendaPag.label" default="Cantidad de registros a mostra (Agenda)" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantAgendaPag" type="number" value="${configuracionInstance?.cantAgendaPag}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'cantNoticiaPag', 'error')} required">
	<label for="cantNoticiaPag">
		<g:message code="configuracion.cantNoticiaPag.label" default="Cantidad de registros a mostra (Noticia)" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantNoticiaPag" type="number" value="${configuracionInstance?.cantNoticiaPag}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'cantPagina', 'error')} required">
	<label for="cantPagina">
		<g:message code="configuracion.cantPagina.label" default="Cantidad de registro por P&aacute;gina" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantPagina" type="number" value="${configuracionInstance?.cantPagina}" required=""/>

</div>
<div
		class="fieldcontain ${hasErrors(bean: configuracionInstance, field: 'institucion', 'error')} required">
		<label for="Institucion"> <g:message code="configuracion.institucion.label"
				default="Institucion" /> <span class="required-indicator">*</span>
		</label>
		<g:select name="institucion.id" from="${Institucion.list()}" optionKey="id" optionValue="nombre" value="${userInstance?.institucion?.id}"/>
	</div>

