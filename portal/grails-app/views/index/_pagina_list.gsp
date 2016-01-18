<g:if test="${lista}">
	
	<g:each in="${lista}" var="entidad">
		<article class="item-noticia">
			<div class="row">
			
				<div class="col-sm-4">
					<img style="width: 200px; height: 150px;" src="${entidad.multimedias[0].getImg()}"
						class="noticia-th" alt="">
				</div>

				<div class="col-sm-8">
					<h2>
						<g:link action="cargarPaginas"
							controller="index" id="${idSubMenu}" params="${[ent:entidad.id]}">
							${entidad.titulo.encodeAsRaw()}
						</g:link>
					</h2>
					<p>
						${entidad.subTitulo.encodeAsRaw()}
					</p>

				</div>

			</div>
		</article>
	</g:each>
</g:if>

<g:if test="${pgCantidad}">
	|
	${pgCantidad}
</g:if>