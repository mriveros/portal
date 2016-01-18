<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Administracion</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}
.right {
	float: right;
	width: 170px;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<a href="#page-body" class="skip"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="right" role="navigation">
		<sec:ifLoggedIn>
			<span style="list-style: none;" >
				Usuario:&nbsp;<sec:loggedInUserInfo field="username"/>
				<g:link controller="Logout"><i class="fa fa-sign-out fa-fw"></i> Salir</g:link>
			</span>
			
		</sec:ifLoggedIn>
	</div>
	<div id="status" role="complementary">
		<ul>
			<g:each in="${grailsApplication.domainClasses.sort{it.fullName}}"
				var="domain">
				<g:if test="${domain.name == 'SubMenu'}">
					<li><g:link controller="subMenu">
							${domain.name}
						</g:link></li>
				</g:if>
				<g:else>
					<g:if test="${domain.name == 'UsuarioPerfil'}">
						<li><g:link controller="usuarioPerfil">
								${domain.name}
							</g:link></li>
					</g:if>
					<g:else>

						<g:if test="${domain.name == 'TipoDocumento'}">
							<li><g:link controller="tipoDocumento">
									${domain.name}
								</g:link></li>
						</g:if>
						<g:else>
							<g:if test="${domain.name == 'UserRole'}">

							</g:if>
							<g:else>
								<g:if test="${domain.name == 'Requestmap'}">

								</g:if>
								<g:else>
									<g:if test="${domain.name == 'User'}">
										<li><g:link controller="${domain.name.toLowerCase()}">
												Usuario</g:link></li>
									</g:if>
									<g:else>
										<g:if test="${domain.name == 'Role'}">
											<li><g:link controller="${domain.name.toLowerCase()}">
												Rol</g:link></li>
										</g:if>
										<g:else>
											<li><g:link controller="${domain.name.toLowerCase()}">
													${domain.name}
												</g:link></li>
										</g:else>

									</g:else>

								</g:else>

							</g:else>

						</g:else>
					</g:else>

				</g:else>
			</g:each>
			
		</ul>
	</div>
	<div id="page-body">
		<h1>Sistema de Gesti&oacute;n de contenidos digitales</h1>
		<ul style="list-style: none;">
			<li>App version: <g:meta name="app.version" /></li>
			<li>Contacto: desarrollotics2@sfp.gov.py</li>
		</ul>

	</div>
</body>
</html>
