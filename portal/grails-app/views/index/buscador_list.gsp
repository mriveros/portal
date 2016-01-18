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
	</header>

	<div class="container-fluid ">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4>Resultados obtenidos</h4>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<section class="noticias-home" id="sec_datos">
							<g:render template="buscador_list"></g:render>
						</section>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

