<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main-presidencia">
<title><g:message code="default.show.label"
		args="${titulo}" /></title>
<style type="text/css">
body {
	margin: 0 auto;
}
img{
	width: 100%;
	height: auto;
	display: inline-block;
	margin-bottom: 15px !important;
}
</style>
</head>
<body>

	<header>
		<%-- Menu --%>
		<g:render template="menu"></g:render>
	</header>

	<div class="container-fluid ">
		<div class="row" style="color: #4e606c;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h1>
					${entidad?.titulo}
				</h1>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="col-md-8">
		<h2>Lugar: ${entidad.lugar.encodeAsRaw()}<h2>
		</div>
		<div class="row">
			
			
			<div class="col-md-8">
				<h3>${entidad?.subTitulo.encodeAsRaw()}<h3>
				<g:if test="${pagina == 'si'}">
					${entidad?.cuerpo.encodeAsRaw()}
				</g:if>
				<g:else>
					${entidad.descripcion.encodeAsRaw()}
				</g:else>
				
			</div>
			
			<div class="col-md-2"></div>
		</div>
		<g:render template="etiqueta"></g:render>
	</div>
</body>
</html>

