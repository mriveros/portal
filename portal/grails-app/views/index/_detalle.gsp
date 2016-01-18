<g:each var="a" in="${detalle}">
	<div class="col-sm-3 item-event">
		<a href="index/cargarDetalleAgenda/${a.id}"><span class="time">
		<g:formatDate date="${a.date}" type="time" style="SHORT" />|
		</span> ${a.titulo}</a>
		
	</div>
</g:each>
¶
<g:set var="index" value="0"></g:set>
<g:each var="a" in="${agenda}">
	<g:if test="${a.fvalue == a.fechaAgenda}">
		<div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 95px;" tabindex="0" role="option" aria-describedby="slick-slide${index++}">
			<a href="#" onclick="loadDetail('${a.fvalue}')" class="active"> ${a.fecha}
			</a>
		</div>
	</g:if>
	<g:else>
		<div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 95px;" tabindex="0" role="option" aria-describedby="slick-slide${index++}">
			<a onclick="loadDetail('${a.fvalue}')" href="#"> ${a.fecha}
			</a>
		</div>
	</g:else>
</g:each>