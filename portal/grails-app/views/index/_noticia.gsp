<g:if test="${noticias}">
	<g:each in="${noticias}" var="nt">
		<article class="item-noticia">
			<div class="row">
				<div class="col-sm-4">
					<img style="width: 200px; height: 150px;" src="${nt.imagen}"
						class="noticia-th" alt="">
				</div>
				<div class="col-sm-8">
					<h2>
						<g:link action="cargarNoticia" controller="index" id="${nt.id}" >${nt.titulo.encodeAsRaw()}</g:link>
					</h2>
					<p class="article-meta">
						<i class="fa fa-calendar"> ${nt.fecha}
						</i>
					</p>
					<p>
						${nt.subTitulo.encodeAsRaw()}
					</p>

				</div>

			</div>
		</article>
	</g:each>
</g:if>
<g:else>
0
</g:else>
|${cantidadNoticia}
