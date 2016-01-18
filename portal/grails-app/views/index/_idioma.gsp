<select class="form-control" id="idioma" >
	<g:each var="n" in="${idioma}">
		<option value="${n.codigo}">${n.descripcion}</option>
	</g:each>
</select>
