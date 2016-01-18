<%@ page import="py.org.presidencia.Multimedia" %>



<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="multimedia.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${multimediaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'contenido', 'error')} required">
	<label for="contenido">
		<g:message code="multimedia.contenido.label" default="Contenido" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="contenido" name="contenido" />

</div>

<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'imagenPorDefecto', 'error')} ">
	<label for="imagenPorDefecto">
		<g:message code="multimedia.imagenPorDefecto.label" default="Imagen por Defecto" />
		
	</label>
	<g:checkBox name="imagenPorDefecto" value="${multimediaInstance?.imagenPorDefecto}" />

</div>

<%--<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'agendas', 'error')} ">--%>
<%--	<label for="agendas">--%>
<%--		<g:message code="multimedia.agendas.label" default="Agendas" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%----%>
<%--</div>--%>
<%----%>
<%--<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'noticias', 'error')} ">--%>
<%--	<label for="noticias">--%>
<%--		<g:message code="multimedia.noticias.label" default="Noticias" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%----%>
<%--</div>--%>
<%----%>
<%--<div class="fieldcontain ${hasErrors(bean: multimediaInstance, field: 'subMenus', 'error')} ">--%>
<%--	<label for="subMenus">--%>
<%--		<g:message code="multimedia.subMenus.label" default="Sub Menus" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%----%>
<%--</div>--%>

