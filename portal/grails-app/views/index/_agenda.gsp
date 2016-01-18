<g:if test="${agendas}">
	<g:each in="${agendas}" var="ag">
		<article class="item-noticia">
			<div class="row">
				<div class="col-sm-4">
					<i class="fa fa-calendar"> ${ag.fecha}
						</i>
				</div>
				<div class="col-sm-8">

					<h2>
						
						${ag.titulo.encodeAsRaw()}
						
					</h2>
					<p class="article-meta">
						<i class="fa fa-clock-o"> ${ag.hora}
						</i>
					</p>
					<p class="article-meta">
						<h4>Lugar: ${ag.lugar.encodeAsRaw()}
						</h4>
					</p>
					<h3>
						${ag.subTitulo.encodeAsRaw()}

					</h3>
						<p>
							${ag.descripcion.encodeAsRaw()}
										
						</p>
				</div>

			</div>
		</article>
	</g:each>
</g:if>
<g:else>
</g:else>
|${cantidadAgenda}
