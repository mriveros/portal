<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	<g:if test="${entidad?.categoria?.id}">
	<img alt="" src="${resource(dir:'images',file:'images.jpeg')}" style="width: 15px; height: 15px;">
		<g:link action="mostrarTag" controller="index" id="${entidad?.categoria?.id }">
			${entidad?.categoria?.descripcion}
		</g:link>
	</g:if>
	</div>
	<div class="col-md-2"></div>
</div>