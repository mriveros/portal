<g:each in="${transparencia}" var="menu">

<li class="dropdown"><a href="#" class="dropdown-toggle"
	data-toggle="dropdown" role="button" aria-haspopup="true"
	aria-expanded="false"> ${menu.titulo}<span class="caret"></span>
</a>
	<ul class="dropdown-menu">
		<g:if test="${menu?.subMenus}">
			<g:each in="${menu?.subMenus?.sort{it.orden}}" var="sub">
				<li><g:if test="${sub.entidad}">
						<g:link action="cargarPagina" params="${[tipo:sub.tipo]}"
							controller="index" id="${sub.id}">
							${sub.titulo}
						</g:link>
					</g:if> <g:else>
						<g:link action="cargarPagina" params="${[tipo:0]}"
							controller="index" id="${sub.id}">
							${sub.titulo}
						</g:link>
					</g:else></li>
			</g:each>
			<li><g:link controller="index" action="indexDocumentos">Actos administrativos </g:link></li>
		</g:if>
		<g:else>
			<li><g:link controller="index" action="indexDocumentos">Actos administrativos </g:link></li>
		</g:else>

	</ul></li>
</g:each>