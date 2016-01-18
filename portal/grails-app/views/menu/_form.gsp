<%@ page import="py.org.presidencia.Menu" %>



<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="menu.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${menuInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="menu.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${menuInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'noEditable', 'error')} ">
	<label for="noEditable">
		<g:message code="menu.noEditable.label" default="Permanente" />
		
	</label>
	<g:checkBox name="noEditable" value="${menuInstance?.noEditable}" />

</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'idioma', 'error')} required">
	<label for="idioma">
		<g:message code="menu.idioma.label" default="Idioma" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="idioma" name="idioma.id" from="${py.org.presidencia.Idioma.list()}" optionKey="id" required="" value="${menuInstance?.idioma?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'orden', 'error')} required">
	<label for="orden">
		<g:message code="menu.idioma.orden" default="Orden" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="orden" required="" value="${menuInstance?.orden}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'subMenus', 'error')} ">
	<label for="subMenus">
		<g:message code="menu.subMenus.label" default="Sub Menus" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${menuInstance?.subMenus?}" var="s">
    <li><g:link controller="subMenu" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subMenu" action="create" params="['menu.id': menuInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subMenu.label', default: 'SubMenu')])}</g:link>
</li>
</ul>


</div>

