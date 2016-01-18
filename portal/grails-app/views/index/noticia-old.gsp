<g:if test="${noticias}">
<g:each in="${noticias}" var="nt">
	<div class='noticia_exp'>
		<div class='noticia_img'>
			<img style='width: 200px; height: 150px;' src="${nt.imagen}"
				alt='img' />
		</div>
		<h2
			style='margin-top: 0px; margin-top: 0px; text-transform: uppercase; color: #990000;'>
			${nt.titulo}
		</h2>
		<p>
			${nt.subTitulo}
		</p>
	</div>
</g:each>
</g:if>
<g:else>
0
</g:else>
|${cantidadNoticia}
