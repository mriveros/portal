<div class="owl-carousel">
	<g:each var="a" in="${detalle}">
		<div class="detalle" style="width: 250px; height: 100px;">
			<span style="font-weight: bold; font-size: 14px;"> ${a.titulo}
			</span><br> <span style="font-size: 12px;"> ${a.subTitulo}
			</span>
		</div>
	</g:each>
</div>
¶
<div
	style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 975px;"
	id="calendario" class="fechas">
	<g:each var="a" in="${agenda}">
		<g:if test="${a.fvalue == a.fechaAgenda}">
			<div class="centro " style="width: 50px; float: left;"
				onclick="loadDetail('${a.fvalue}')">
				<span
					style="text-align: center; padding-left: 5px; font-size: 14px;">
					${a.fecha}
				</span>
			</div>
		</g:if>
		<g:else>
			<div style="width: 50px; float: left;"
				onclick="loadDetail('${a.fvalue}')">
				<span
					style="text-align: center; padding-left: 5px; font-size: 14px;">
					${a.fecha}
				</span>
			</div>

		</g:else>
	</g:each>
</div>