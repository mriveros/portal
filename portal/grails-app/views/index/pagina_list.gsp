<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main-presidencia">
<title></title>
<style type="text/css">
body {
	margin: 0 auto;
}
</style>
</head>
<body>

	<header>
		<%-- Menu --%>
		<g:render template="menu"></g:render>
		<script type="text/javascript">
		
			var datos = 0;
			
			function cargaDatos(){
				if(parseInt("${cantReg}") > parseInt("${cantidadPg}")){
					datos = datos + parseInt("${cantidadPg}");
					$.ajax({
							url:"${request.contextPath}/index/ajaxGetEntidad",
							type:"POST",
							data : 'offset=' + datos + '&max='+"${cantidadPg}" + '&id=' + ${idSubMenu},
						success : function(result) {
							var v = result.split("|");
							$("#sec_datos").append(v[0]);
							if (datos >= parseInt(v[1])) {
								$("#load").html("Estos son los últimos registros");
							}
	
						}
					});
				}else{
					$("#load").html("");
				}
				return false;
			}

		</script>
	</header>

	<div class="container-fluid ">
		<div class="panel panel-default">
			<div class="panel-heading">
				<p style="text-align: left;">
					<h4>${titulo}</h4>
				</p>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<section class="noticias-home" id="sec_datos">
							<g:render template="pagina_list"></g:render>
						</section>

						<div id="load" class="vermas">
							<a id="load-link" onclick="cargaDatos();" class="btn btn-primary">Ver
								más</a>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
