<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="main-navigation">
			<ul class="nav navbar-nav">
				<g:each in="${menus.sort{it.orden}}" var="menu">
					<g:if test="${menu.subMenus}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> ${menu.titulo}<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<g:each in="${menu.subMenus.sort{it.orden}}" var="sub">
									<li><g:if test="${sub.entidad}">
											<g:link action="cargarPagina" params="${[tipo:sub.tipo]}"
												controller="index" id="${sub.id}">
												${sub.titulo}
											</g:link>
										</g:if> 
										<g:else>
										   <g:if test="${sub?.tipo == "3" }">
										   		<g:link action="cargarPagina" params="${[tipo:sub.tipo]}"
												controller="index" id="${sub.id}">
												${sub.titulo}
											</g:link>
										   </g:if>
										   <g:else>
												<g:link action="cargarPagina" params="${[tipo:0]}"
												controller="index" id="${sub.id}">
												${sub.titulo}
											</g:link>	   
										   </g:else>
											
										</g:else></li>
								</g:each>
							</ul></li>
							
					</g:if>
					<g:else>
						<g:if test="${menu?.titulo} == 'Inicio'">
							<li><g:link controller="index" action="index">
									${menu.titulo}
								</g:link></li>
						</g:if>
						
						
						<g:else>

							<li><a href="#"> ${menu.titulo}
							</a></li>


						</g:else>
					
					
					</g:else>
					
				</g:each>
			
				<%--					<ul class="dropdown-menu">--%>
				<%--						<g:each in="${grailsApplication.domainClasses.sort{it.fullName}}"--%>
				<%--							var="domain">--%>
				<%--							<g:if test="${domain.name == 'SubMenu'}">--%>
				<%--								<li><g:link controller="subMenu">--%>
				<%--										${domain.name}--%>
				<%--									</g:link></li>--%>
				<%--							</g:if>--%>
				<%--							<g:else>--%>
				<%--								<g:if test="${domain.name == 'UsuarioPerfil'}">--%>
				<%--									<li><g:link controller="usuarioPerfil">--%>
				<%--											${domain.name}--%>
				<%--										</g:link></li>--%>
				<%--								</g:if>--%>
				<%--								<g:else>--%>
				<%----%>
				<%--									<g:if test="${domain.name == 'TipoDocumento'}">--%>
				<%--										<li><g:link controller="tipoDocumento">--%>
				<%--												${domain.name}--%>
				<%--											</g:link></li>--%>
				<%--									</g:if>--%>
				<%--									<g:else>--%>
				<%--									<li><g:link controller="${domain.name.toLowerCase()}">--%>
				<%--											${domain.name}--%>
				<%--										</g:link></li>--%>
				<%--								</g:else>--%>
				<%--								</g:else>--%>
				<%--								--%>
				<%--							</g:else>--%>
				<%--						</g:each>--%>

				<%--					</ul></li>--%>

				<%--				<li class="dropdown"><a href="#" class="dropdown-toggle"--%>
				<%--					data-toggle="dropdown" role="button" aria-haspopup="true"--%>
				<%--					aria-expanded="false">Transparencia<span class="caret"></span>--%>
				<%--				</a>--%>
				<%--					<ul class="dropdown-menu">--%>
				<%--						<li><g:link controller="index" action="indexDocumentos">--%>
				<%--											Actos administrativos--%>
				<%--										</g:link></li>--%>
				<%--					</ul></li>--%>
			</ul>
		</div>
	</div>
</nav>

