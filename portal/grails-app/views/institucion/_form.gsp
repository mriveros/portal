<%@ page import="py.org.presidencia.Institucion"%>



<div
	class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'nombre', 'error')} required">
	<label for="nombre"> <g:message code="institucion.nombre.label"
			default="Nombre" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required=""
		value="${institucionInstance?.nombre}" />

</div>

<%--<div class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'usuario', 'error')} ">--%>
<%--	<label for="usuario">--%>
<%--		<g:message code="institucion.usuario.label" default="Usuario" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:select id="usuario" name="usuario.id" from="${py.org.presidencia.Usuario.list()}" optionKey="id" value="${institucionInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>--%>
<%----%>
<%--</div>--%>

<div
	class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'activo', 'error')} ">
	<label for="activo"> <g:message code="institucion.activo.label"
			default="Activo" />

	</label>
	<g:checkBox name="activo" value="${institucionInstance?.activo}" />

</div>

<g:if test="${flash?.edit}">

	<div
		class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'agendas', 'error')} ">
		<label for="agendas"> <g:message
				code="institucion.agendas.label" default="Agendas" />

		</label>

		<ul class="one-to-many">
			<g:each in="${institucionInstance?.agendas?}" var="a">
				<li><g:link controller="agenda" action="show" id="${a.id}">
						${a?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="agenda" action="create"
					params="['institucion.id': institucionInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'agenda.label', default: 'Agenda')])}
				</g:link></li>
		</ul>


	</div>

	<div
		class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'contactos', 'error')} ">
		<label for="contactos"> <g:message
				code="institucion.contactos.label" default="Contactos" />

		</label>

		<ul class="one-to-many">
			<g:each in="${institucionInstance?.contactos?}" var="c">
				<li><g:link controller="contacto" action="show" id="${c.id}">
						${c?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="contacto" action="create"
					params="['institucion.id': institucionInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'contacto.label', default: 'Contacto')])}
				</g:link></li>
		</ul>


	</div>

	<div
		class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'noticias', 'error')} ">
		<label for="noticias"> <g:message
				code="institucion.noticias.label" default="Noticias" />

		</label>

		<ul class="one-to-many">
			<g:each in="${institucionInstance?.noticias?}" var="n">
				<li><g:link controller="noticia" action="show" id="${n.id}">
						${n?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="noticia" action="create"
					params="['institucion.id': institucionInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'noticia.label', default: 'Noticia')])}
				</g:link></li>
		</ul>


	</div>

	<div
		class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'servicios', 'error')} ">
		<label for="servicios"> <g:message
				code="institucion.servicios.label" default="Servicios" />

		</label>

		<ul class="one-to-many">
			<g:each in="${institucionInstance?.servicios?}" var="s">
				<li><g:link controller="servicio" action="show" id="${s.id}">
						${s?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="servicio" action="create"
					params="['institucion.id': institucionInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'servicio.label', default: 'Servicio')])}
				</g:link></li>
		</ul>
</g:if>

</div>

