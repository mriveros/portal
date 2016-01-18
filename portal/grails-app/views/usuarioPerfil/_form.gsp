<%@ page import="py.org.presidencia.UsuarioPerfil" %>



<div class="fieldcontain ${hasErrors(bean: usuarioPerfilInstance, field: 'perfil', 'error')} required">
	<label for="perfil">
		<g:message code="usuarioPerfil.perfil.label" default="Perfil" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="perfil" name="perfil.id" from="${py.org.presidencia.Perfil.list()}" optionKey="id" required="" value="${usuarioPerfilInstance?.perfil?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioPerfilInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="usuarioPerfil.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${py.org.presidencia.Usuario.list()}" optionKey="id" required="" value="${usuarioPerfilInstance?.usuario?.id}" class="many-to-one"/>

</div>

