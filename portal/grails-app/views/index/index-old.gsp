<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet"
	href="${resource(dir:'css',file:'style.css')}" />
<link type="text/css" rel="stylesheet"
	href="${resource(dir:'css',file:'slider.css')}" />
<link type="text/css" rel="stylesheet"
	href="${resource(dir:'css',file:'owl.carousel.css')}" />
<title>Presidencia de la República del Paraguay</title>
<script type="text/javascript"
	src="${resource(dir:'js',file:'jquery.js')}"></script>
<script type="text/javascript"
	src="${resource(dir:'js',file:'owl.carousel.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js',file:'jquery.ba-resize.js')}"></script>
<script type="text/javascript">

	var noticia = 0;
	function loadDetail(id){
		 $.ajax({
            url: "${request.contextPath}/index/getDetalle",
			type : 'POST',
			data : 'fecha=' + id,
			success : function(resp) {
				var datos = resp.split("¶");
				$('#calendario').html(datos[1]);
				$('#resultado').html(datos[0]);
				$(".owl-carousel").owlCarousel({
					margin : 15,
					loop : false,
					autoWidth : true,
				});
			}
		})
		return false;
	}

	$(document).ready(function() {
		$(".owl-carousel").owlCarousel({
			margin : 15,
			loop : false,
			autoWidth : true,
		});
				
		if(parseInt("${cantidadNoticia}") > 4){
			$("#load-link").click(function(){
				noticia = noticia + parseInt("${pgNoticia}");
				$.ajax({
						url:"${request.contextPath}/index/ajaxGetNoticias",
						type:"POST",
						data : 'offset=' + noticia + '&max='+"${pgNoticia}",
						success: function(result){
								var v = result.split("|");
								$(v[0]).insertBefore("#load");
								if(noticia >= parseInt(v[1]) ){
									$("#load").html("");
								}
								
						}
					});
				return false;
			})
		}
	});


</script>
<style type="text/css">	
.detalle {
	box-shadow: 2px -2px 2px 1px #d8d9d9 !important;
	width: 472px;
}

.centro {
	border: 2px solid #a1a1a1;
	background: #dddddd;
	border-radius: 25px;
}

.fechas {
	cursor: pointer;
}

h2 {
	font-size: 14px;
}

.btn-default {
	color: #333;
	background-color: #fff;
	border-color: #ccc
}

.btn-default.focus, .btn-default:focus {
	color: #333;
	background-color: #e6e6e6;
	border-color: #8c8c8c
}

.btn-default:hover {
	color: #333;
	background-color: #e6e6e6;
	border-color: #adadad
}

.btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default
	{
	color: #333;
	background-color: #e6e6e6;
	border-color: #adadad
}

.btn-default.active.focus, .btn-default.active:focus, .btn-default.active:hover,
	.btn-default:active.focus, .btn-default:active:focus, .btn-default:active:hover,
	.open>.dropdown-toggle.btn-default.focus, .open>.dropdown-toggle.btn-default:focus,
	.open>.dropdown-toggle.btn-default:hover {
	color: #333;
	background-color: #d4d4d4;
	border-color: #8c8c8c
}

.btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default
	{
	background-image: none
}

.btn-default.disabled, .btn-default.disabled.active, .btn-default.disabled.focus,
	.btn-default.disabled:active, .btn-default.disabled:focus, .btn-default.disabled:hover,
	.btn-default[disabled], .btn-default[disabled].active, .btn-default[disabled].focus,
	.btn-default[disabled]:active, .btn-default[disabled]:focus,
	.btn-default[disabled]:hover, fieldset[disabled] .btn-default, fieldset[disabled] .btn-default.active,
	fieldset[disabled] .btn-default.focus, fieldset[disabled] .btn-default:active,
	fieldset[disabled] .btn-default:focus, fieldset[disabled] .btn-default:hover
	{
	background-color: #fff;
	border-color: #ccc
}

.btn-default .badge {
	color: #fff;
	background-color: #333
}
</style>
</head>
<body>
	<!--cabecera-->
	<header>
		<div class="buscar_top">
			<img src="${resource(dir:'images',file:'buscar.png')}" />
		</div>
		<div class="cabecera" style="clear: both;">
			<div class="cabecera_cont">
				<a href="#" class="logo_isz"></a> <a href="#" class="logo_der"></a>
			</div>
		</div>
	</header>

	<!--menu-->
	<div class="menu">
		<div class="menu_cont">
			<g:render template="menu"></g:render>
		</div>
	</div>

	<!--agenda-->
	<div class="calendario border" class="fechas">
		<div style="width: 80%; padding-left: 20%; margin-top: 5px;">
			<div
				style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 975px;"
				id="calendario" class="fechas">
				<g:each var="a" in="${agenda}">
					<g:if test="${a.fvalue == new Date().format('yyyy/MM/dd')}">
						<div class="centro" style="width: 50px; float: left;"
							onclick="loadDetail('${a.fvalue}')">
							<span
								style="text-align: center; padding-left: 5px; font-size: 14px; cursor: hand;">
								${a.fecha}
							</span>
						</div>
					</g:if>
					<g:else>
						<div style="width: 50px; float: left;"
							onclick="loadDetail('${a.fvalue}')">
							<span
								style="text-align: center; padding-left: 5px; font-size: 14px;">
								${a.fecha}
							</span>
						</div>

					</g:else>
				</g:each>
			</div>
		</div>
	</div>
	<div class="agenda border">
		<div
			style="width: 150px; font-weight: bold; display: inline; float: left;">
			Agenda:</div>
		<div id="resultado" style="width: 90%">
			<div class="owl-carousel">
				<g:each var="a" in="${detalle}">

					<div style="width: 250px; height: 100px;" class="detalle">
						<span style="font-weight: bold; font-size: 14px;"> ${a.titulo}
						</span><br /> <span> <span style="font-size: 12px;"> ${a.subTitulo}
						</span>
						</span>

					</div>
				</g:each>
			</div>
		</div>
	</div>

	<!--slider-->
	<div id="container" style="margin-top: -5px;">
		<span class="slide1"><img
			src="${resource(dir:'images',file:'slide_1.jpg')}" alt="" /></span> <span
			class="slide2"><img
			src="${resource(dir:'images',file:'slide_2.jpg')}" alt="" /></span> <span
			class="slide3"><img
			src="${resource(dir:'images',file:'slide_3.jpg')}" alt="" /></span> <span
			class="slide4"><img
			src="${resource(dir:'images',file:'slide_1.jpg')}" alt="" /></span> <span
			class="slide5"><img
			src="${resource(dir:'images',file:'slide_2.jpg')}" alt="" /></span> <span
			class="slide6"><img
			src="${resource(dir:'images',file:'slide_3.jpg')}" alt="" /></span> <span
			class="slide7"><img
			src="${resource(dir:'images',file:'slide_1.jpg')}" alt="" /></span> <span
			class="slide8"><img
			src="${resource(dir:'images',file:'slide_2.jpg')}" alt="" /></span> <span
			class="slide9"><img
			src="${resource(dir:'images',file:'slide_3.jpg')}" alt="" /></span> <span
			class="slide10"><img
			src="${resource(dir:'images',file:'slide_1.jpg')}" alt="" /></span>
	</div>

	<!--contenido general-->

	<div class="cont_general">

		<!-- noticias-->
		<div class="noticias">

			<g:each in="${noticias}" var="nt">
				<div class="noticia_exp">
					<div class="noticia_img">
						<img style="width: 200px; height: 150px;" src="${nt.imagen}"
							alt="img" />
					</div>
					<h2
						style="margin-top: 0px; margin-top: 0px; text-transform: uppercase; color: #990000;">
						${nt.titulo}
					</h2>
					<p>
						${nt.subTitulo}
					</p>
				</div>
			</g:each>
			<g:if test="${cantidadNoticia > pgNoticia}">
			<div id="load">
			<a id="load-link" class="btn btn-default" href="#">Noticias[+]</a>
			</div>
			</g:if>
			
		</div>
		

		<!--columna-->
		<div class="columna">
			<div
				style="float: right; margin-bottom: 30px; border-color: #990000; border-style: solid; border-collapse: collapse;">
				<g:if test="${servicios =! null }">
					<p
						style="background-color: #990000; border-collapse: collapse; color: white; text-align: center; width: 378px; height: 50px; vertical-align: center; font-size: 26px; border-style: solid; border-color: #990000;">
						Servicios</p>
					<g:each in="${servicios}" var="s">
						<p
							style="background-color: #c9c9c9; margin-top: -5px;; text-align: center; width: 100%; height: 50px; vertical-align: center; font-size: 26px; border-style: solid; border-color: #990000; box-shadow: 0px 5px 7px 0px rgba(0, 0, 0, 0.1);">
							<a style="color: #123c4c;" href="${s.url}"> ${s.nombre}
							</a>
						</p>
					</g:each>
				</g:if>

			</div>
			<g:if test="${contacto}">
				<div
					style="float: right; background-color: #00384A; width: 347px; height: 180px;">
					<div style="border-color: #F3F6F4; border-style: solid; width: 70%; height: 60%; margin-left: 50px; margin-top: 35px;">
						<div style="width:100%; height: 50%;">
							<div style="color: #F3F6F4; text-align: center;">
								<span style="display: block;">
									${contacto.titulo}
								</span>
								<hr style="color: white;">
							</div>
							<div
								style="margin-top: 30px;text-align: center;">
								<button>IR AL FORMULARIO</button>
							</div>
						</div>
					</div>
				</div>
			</g:if>

			<%--			<img src="${resource(dir:'images',file:'escriba.png')}"--%>
			<%--				style="float: right; margin-bottom: 30px;" />--%>
		</div>

	</div>
	<%--	</div>--%>


	<!--footer-->
	<footer>
		<div class="footer">
			<h3>Presidencia de la República del Paraguay</h3>
			<p>Palacio de Gobierno, El Paraguayo Independiente entre O'leary
				y Ayolas | Teléfono: (595 21) 4140200 | Copyright © 2015, Todos los
				derechos reservados</p>
		</div>
	</footer>

</body>
</html>