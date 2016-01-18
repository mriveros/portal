<ul class="nav nav-tabs" >
	<g:each in="${menus}" var="menu">
		<g:if test="${menu.subMenus}">
			<li class="dropdown" ><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">${menu.titulo}<span class="caret"></span></a>
				<ul class="dropdown-menu" style="position: absolute;z-index: 20;">
					<g:each in="${menu.subMenus}" var="sub">
					<li><a href="${sub.link}">${sub.titulo}</a></li>
					</g:each>
				</ul>
			</li>
		</g:if>
		<g:else>
			<li><a href="#">${menu.titulo}</a></li>
		</g:else>
	</g:each>
</ul>