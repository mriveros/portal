<!DOCTYPE html>
<%@page import="py.org.presidencia.PresidenciaService"%>
<html>
<head>
<meta name="layout" content="main-presidencia">

<script type="text/javascript">

	var noticia = 0;
	var agenda= 0;
	function loadDetail(id){
		 $.ajax({
            url: "${request.contextPath}/index/getDetalle",
			type : 'POST',
			data : 'fecha=' + id,
			success : function(resp) {
				var datos = resp.split("¶");
				$('#resultado').html(datos[0]);
				$('#calendario').html(datos[1]);
			}
		})
		return false;
	}

	$(document).ready(function() {
						
		if(parseInt("${cantidadNoticia}") > 4){
		
			$("#load-link").click(function(){
				noticia = noticia + parseInt("${pgNoticia}");
				
				$.ajax({
						url:"${request.contextPath}/index/ajaxGetNoticias",
						type:"POST",
						data : 'offset=' + noticia + '&max='+"${pgNoticia}",
					success : function(result) {
						var v = result.split("|");
						$(v[0]).insertBefore("#load");
						if (noticia >= parseInt(v[1])) {
							$("#load").html("Estas son las ultimas noticias");
						}

					}
				});
				return false;
			})
			
		}
	
		if(parseInt("${cantidadAgenda}") > 4){
				
			$("#load-linkAg").click(function(){
			
				agenda = agenda + parseInt("${pgAgenda}");
				
				$.ajax({
						url:"${request.contextPath}/index/ajaxGetAgendas",
						type:"POST",
						data : 'offset2=' + agenda + '&max2='+"${pgAgenda}",
					success : function(result) {
						var v = result.split("|");
						$(v[0]).insertBefore("#loadAg");
						if (agenda >= parseInt(v[1])) {
							$("#loadAg").html("Estas son las ultimas agendas");
						}

					}
				
				});
				
				return false;
			})
		}
		$('#calendario').css('display','block');
	});
	
	
	
</script>
</head>
<body>
	<header id="menu">	
		<%-- Menu --%>
		<g:render template="menu"></g:render>
	</header>
	<%--	Agenda --%>
	<section class="agenda">
		<div class="agenda-dates">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<a role="button" data-toggle="collapse" href="#collapseAgenda"
							aria-expanded="false" aria-controls="collapseAgenda"
							class="collapseAgendabtn"> <i class="fa fa-angle-up"></i> <i
							class="fa fa-calendar"></i> <span class="agenda-title">Agenda</span>
						</a>
					</div>
					<div class="col-xs-10 dates">
						<div class="dates-scroll">
							<div class="agenda-dates-slide" id="calendario" style="display: none;">

								<%-- Calendario --%>

								<g:each var="a" in="${agenda}">
									<g:if test="${a.fvalue == new Date().format('yyyy/MM/dd')}">
										<div>
											<a href="#" onclick="loadDetail('${a.fvalue}')"
												class="active"> ${a.fecha}
											</a>
										</div>
									</g:if>
									<g:else>
										<div>
											<a onclick="loadDetail('${a.fvalue}')" href="#"> ${a.fecha}
						
											</a>
										
										</div>
									</g:else>
								</g:each>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%--	Detalle de Agenda--%>

		<div class="agenda-events collapse in" id="collapseAgenda">
			<div class="container">
				<div class="agenda-events-slide" id="resultado">

					<g:each var="a" in="${detalle}">

						<div class="col-sm-3 item-event">
							<a href="index/cargarDetalleAgenda/${a.id}"><span class="time"><g:formatDate
										date="${a.hora}" format="HH:mm" />| </span> ${PresidenciaService.getSubString(a.titulo, 70) }: ${PresidenciaService.getSubString(a.subTitulo, 70)}</a>
							
						</div>
					</g:each>

				</div>
			</div>
		</div>
	</section>
	<%--	Slider --%>

	<div class="container">
		<div id="slider-main" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<g:each status="i" in="${slide}" var="nt">
					<g:if test="${i == 0}">
						<li data-target="#slider-main" data-slide-to="${i}"
							class="active"></li>
					</g:if>
					<g:else>
						<li data-target="#slider-main" data-slide-to="${i}"></li>
					</g:else>
				</g:each>

			</ol>

			<div class="carousel-inner" role="listbox">
				<g:each status="i" var="nt" in="${slide}">
					<g:if test="${i == 0}">
						<div class="item active"
							style="background-image: url(${nt.imagen});">
							<div class="slide-info">
								<h1>
									<g:link action="cargarNoticia" id="${nt.id}" controller="index">
										${nt.titulo }
									</g:link>

								</h1>
							</div>
							<img src="${resource(dir:'images',file:'px.gif')}" alt="">
						</div>
					</g:if>
					<g:else>
						<div class="item" style="background-image: url(${nt.imagen});">
							<div class="slide-info">
								<h1>
									<g:link action="cargarNoticia" id="${nt.id}" controller="index">
										${nt.titulo.encodeAsRaw() }
									</g:link>

								</h1>
							</div>
							<img src="${resource(dir:'images',file:'px.gif')}" alt="">
						</div>
					</g:else>
				</g:each>
				
			</div>
		</div>
	</div>
	
	<div class="container">
	<h2>Noticias</h2>
		<div class="row">
			<div class="col-md-8">
				<section class="noticias-home" id="">
					<%--Item Noticia--%>
					<g:each in="${noticias}" var="nt">
						<article class="item-noticia">
							<div class="row">

								<div class="col-sm-4">
									<img style="width: 200px; height: 150px;" src="${nt.imagen}"
										class="noticia-th" alt="">
								</div>
								<div class="col-sm-8">

									<h2>
										<g:link action="cargarNoticia" controller="index"
											id="${nt.id}">
											${nt.titulo.encodeAsRaw()}
										</g:link>

									</h2>
									<p class="article-meta">
										<i class="fa fa-calendar"> ${nt.fecha}
										</i>
									</p>
									<p>
										${PresidenciaService.getSubString(nt.subTitulo).encodeAsRaw()}
									</p>

								</div>

							</div>
						</article>
					</g:each>
					<div id="load" class="vermas">
						<a id="load-link" class="btn btn-primary">Ver más noticias</a>
					</div>
				</section>
			</div>
			
			
			
			<div class="col-md-4">
			
				<aside>
					<%--Servicios--%>
					<g:if test="${servicios}">
						<div class="servicios">
							<div class="servicios-inner">

								<h3 style="text-align: center; vertical-align: middle;">Servicios</h3>
								<div class="row">
									<g:each in="${servicios}" var="s">
										<div class="col-lg-12 col-md-12 col-sm-6 servicio-bar">
											<a class="servicio-link" target="_blank" href="${s.url}"> ${s.nombre}
											</a>
										</div>
									</g:each>
								</div>
							</div>
						</div>
					</g:if>
					<%--Contacto--%>
					<g:if test="${contacto}">
						<div class="escriba">
							<div class="escriba-inner">
								<h2>
									${contacto.titulo}
								</h2>
								<g:link action="contacto" controller="contacto"
									class="btn btn-default">Ingresar</g:link>
							</div>
						</div>
					</g:if>
				</aside>
			</div>
			<%-- Aqui modificamos nuestra pagina principal para agregar la agenda--%>
			<div class="col-md-8">
			<h2>Agenda</h2>
				<section class="noticias-home" id="">
					<%--Item Noticia--%>
					<g:each in="${detalle}" var="ag">
						<article class="item-noticia">
							<div class="row">
								<div class="col-sm-4">
											<p class="article-meta">
												<i class="fa fa-calendar"> ${ag.fecha.format('dd/MM/yyyy')}
												</i>
											</p>
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
										<h4>Lugar: ${ag.lugar}
										</h4>
									</p>
									<h3>
										${ag.subTitulo.encodeAsRaw()}

									</h3>
									<p>
									${PresidenciaService.getSubString70(ag.descripcion).encodeAsRaw()}
										
									</p>

								</div>

							</div>
							
						</article>
						
					</g:each>
					<div id="loadAg" class="vermas">
						<a id="load-linkAg" class="btn btn-primary">Ver más</a>
					</div>
				</section>
			</div>
			<%--Hasta aca nuestra modificacion para mostrar la agenda--%>
		</div>
	</div>
</body>
</html>
