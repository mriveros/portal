<!DOCTYPE html>
<%@page import="py.org.presidencia.IndexController"%>
<%@page import="javax.imageio.ImageTypeSpecifier.Indexed"%>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Presidencia de la República del Paraguay</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Presidencia de la República del Paraguay" />
<meta name="keywords" content="" />
<%--CSS--%>
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'style.min.css')}" type="text/css">
<%--JS--%>
<script src="${resource(dir:'js',file:'jquery.js')}"
	type="text/javascript"></script>
<script src="${resource(dir:'js',file:'bootstrap.min.js')}"
	type="text/javascript"></script>
<script src="${resource(dir:'js',file:'slick.min.js')}"
	type="text/javascript"></script>
<script src="${resource(dir:'js',file:'main.min.js')}"
	type="text/javascript"></script>
<g:layoutHead />
</head>
<body>

	<header>
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-xs-4">
						<a href="index" class="logo">Presidencia de la República del
							Paraguay</a>
					</div>
					<div class="col-xs-4">
						<div class="logo-gobierno">Gobierno Nacional</div>
					</div>
					<div class="col-xs-4">
						<div class="header-tools">
							<div class="herramientas">
								<a href="#" title="Facebook" class="fb-link"><i
									class="fa fa-facebook-square"></i></a> <a href="#" title="Twitter"
									class="tw-link"><i class="fa fa-twitter-square"></i></a> <a
									class="navbar-search" data-toggle="collapse"
									data-parent="#toptabs" href="#mainsearch" aria-expanded="true"
									aria-controls="toptabs"><span class="sr-only">Buscar</span>
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>


								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse" data-target="#main-navigation"
									aria-expanded="false">
									<span class="sr-only">Menu</span> <span
										class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
								</button>
							</div>
							<div class="idioma" id="div-idioma">

								<%--								<g:select name="idioma" from="${IndexController.obtenerIdiomas()}"--%>
								<%--									optionKey="codigo" optionValue="descripcion" />--%>
								<%--								<select name="">--%>
								<%--									<option value="es">Español</option>--%>
								<%--									<option value="gn">Guarani Avañe'ẽ</option>--%>
								<%--									<option value="en">English</option>--%>
								<%--								</select>--%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%--	Buscador General--%>
		<div class="panel-group header-search" id="toptabs">
			<div class="panel panel-default">
				<div class="panel-collapse collapse" id="mainsearch">
					<div class="panel-body">
						<div class="panel-centered">
							<div class="container">
								<div class="row">
									<g:form name="frm_buscar" action="buscarContenido"
										controller="index" method="POST">
										<div class="col-sm-2"></div>
										<div class="col-sm-6">
											<input class="searchfield" id="cadena" name="cadena"
												placeholder="Buscar en el sitio" type="text">
										</div>
										<div class="col-sm-2">
											<a class="btn btn-primary btn-block" id="btn_buscar"
												onclick="$('#frm_buscar').submit()"> Buscar </a>
										</div>
										<div class="col-sm-2"></div>
									</g:form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</header>
	<g:layoutBody />
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<a href="#" class="logo">Presidencia de la República del
						Paraguay</a> <a href="javascript:void(0);" class="logo-gobierno">-
						Gobierno Nacional</a>
				</div>
				<div class="col-md-9 footer-info">
					<h5>Presidencia de la República del Paraguay</h5>
					<strong>Palacio de Gobierno:</strong> El Paraguayo Independiente
					entre O'leary y Ayolas<br /> <strong>Teléfono:</strong> (595 21)
					414 0200<br /> Copyright © 2015 - Todos los Derechos Reservados
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
	$('document').ready(function(){

		$.ajax({
			url:"${request.contextPath}/index/obtenerIdiomas",
			type:"POST",
			data : "",
		success : function(result) {
			$('#div-idioma').html(result);
			$('#idioma').on('change',function(){
				$.ajax({
					type:'POST',
					url: "${request.contextPath}/index/cargarMenu",
					data: "codigo="+$('#idioma').val(),
					success: function(result){
						
							if(result){
								$('#menu').html(result);
							}
					}
				});
			});
		}
	});
		
<%--		$.ajax(--%>
<%--			type:'POST',--%>
<%--			data: "",--%>
<%--				url: "${request.contextPath}/index/obtenerIdiomas",--%>
<%--				success: function(result){--%>
<%--					 $('#div-idioma').html(result);--%>
<%--					 $('#idioma').on('change',function(){--%>
<%--							$.ajax({--%>
<%--									type:'POST',--%>
<%--									url: "${request.contextPath}/index/cargarMenu",--%>
<%--									data: "codigo="$('#idioma').val(),--%>
<%--									success: function(result){--%>
<%--											if(result){--%>
<%--												$('#menu').html(result);--%>
<%--											}--%>
<%--									}--%>
<%--							});--%>
<%--					});--%>
<%--				}--%>
<%--		);--%>
		
	});
	</script>
</body>
</html>