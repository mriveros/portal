<%@page import="py.org.presidencia.Multimedia"%>

<g:each in="${lista}" var="entidad">
	<article class="item-noticia">
		<div class="row">

			<div class="col-sm-4">
			<g:if test="${entidad?.multimedias}" >
				<img style="width: 200px; height: 150px;"
					src="${entidad.multimedias[0].getImg()}" class="noticia-th" alt="">
			</g:if>
			<g:else>
				<img style="width: 200px; height: 150px;"
					src="${py.org.presidencia.Multimedia.findByImagenPorDefecto(true)?.getImg()}" class="noticia-th" alt="">
			</g:else>
			</div>

			<div class="col-sm-8">
				<h2>
					<g:link action="mostarPagina" controller="index" id="${entidad.id}">
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
