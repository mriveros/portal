<%@ page import="py.org.presidencia.Agenda" %>



<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="agenda.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${agendaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'lugar', 'error')} ">
	<label for="lugar">
		<g:message code="agenda.lugar.label" default="Lugar" />
		
	</label>
	<g:textField name="lugar" value="${agendaInstance?.lugar}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'hora', 'error')} required">
	<label for="hora">
		<g:message code="agenda.hora.label" default="Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="hora" precision="day"  value="${agendaInstance?.hora}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="agenda.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" maxlength="100" required="" value="${agendaInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'subTitulo', 'error')} required">
	<label for="subTitulo">
		<g:message code="agenda.subTitulo.label" default="Sub Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subTitulo" maxlength="150" required="" value="${agendaInstance?.subTitulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="agenda.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${agendaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="agenda.categoria.label" default="Categoria" />
		
	</label>
	<g:select id="categoria" name="categoria.id" from="${py.org.presidencia.Categoria.list()}" optionKey="id" value="${agendaInstance?.categoria?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: agendaInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="agenda.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institucion" name="institucion.id" from="${py.org.presidencia.Institucion.list()}" optionKey="id" required="" value="${agendaInstance?.institucion?.id}" class="many-to-one"/>

</div>

