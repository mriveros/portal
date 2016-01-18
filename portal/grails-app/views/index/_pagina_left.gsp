<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main-presidencia">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><g:message code="default.show.label"
		args="${titulo}" /></title>
<style type="text/css">
body {
	margin: 0 auto;
}
<%--@media screen and (mid-width: 580px)  {--%>
<%--	.imagen{--%>
<%--		width:  460px !important;--%>
<%--	}--%>
<%--}--%>
<%----%>
<%--@media screen and (mid-width: 480px and max-width: 560px)  {--%>
<%--	.imagen{--%>
<%--		width:  360px !important;--%>
<%--		padding-bottom: 10px !important;--%>
<%--	}--%>
<%--}--%>
<%----%>
<%--@media screen and (mid-width: 360px and max-width: 460px)  {--%>
<%--	.imagen{--%>
<%--		width:  260px !important;--%>
<%--		padding-bottom: 10px !important;--%>
<%--		--%>
<%--	}--%>
<%--}--%>
<%----%>
<%--@media screen and (mid-width: 260px and max-width: 360px)  {--%>
<%--	.imagen{--%>
<%--		width:  160px !important;--%>
<%--		padding-bottom: 10px !important;--%>
<%--		--%>
<%--	}--%>
<%--}--%>

img{
	width: 100%;
	height: auto;
	display: inline-block;
}

</style>
</head>
<body>

	<header>
		<%-- Menu --%>
		<g:render template="menu"></g:render>
	</header>

	<div class="container-fluid ">
		<div class="row" style="color: #4e606c">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h1>
					${entidad?.titulo}
				</h1>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="div-imagen" style="float: left; padding-right: 15px;">
					<img class="imagen img-thumbnail img-responsive " alt="" src="${imagen}" >
				</div>
				${entidad?.subTitulo.encodeAsRaw()}
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

