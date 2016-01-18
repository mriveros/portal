<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main-presidencia">
<title>Formulario</title>
</head>
<body>
	<header>
		<%-- Menu --%>
		<g:render template="../index/menu"></g:render>
	</header>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading ">Por favor, ingrese sus datos.</div>
			<g:if test="${flash?.message}">
				<div class="alert alert-success" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:if test="${flash?.error}">
				<div class="alert alert-danger" role="status">
					${flash.error}
				</div>
			</g:if>
			<g:hasErrors>
				<div class="alert alert-danger" role="status">Complete los
					datos requeridos *</div>
			</g:hasErrors>
			<div class="panel-body" style="text-align: center; margin: 0 auto;">
				<g:form action="sendMail" controller="contacto" method="POST">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="nombre">Nombre*</label>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="text" name="nombre" class="form-control"
									id="nombre" value="${flash?.nombre}" required="">
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="apellido">Apellido*</label>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="text" name="apellido" class="form-control"
									id="apellido" value="${flash?.apellido }" required="">
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="apellido">C.I*</label>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<input type="text" name="ci" class="form-control" id="ci"
									value="${flash?.ci}" required="">
							</div>
						</div>
						<div class="col-md-1" style="width: 50px !important;">
							<input style="width: 80px; font-size: 12px;" class="btn btn-info" type="button" id="busq" onclick="getDatos();" name="busq" value="Buscar" />
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="apellido">Nro. Telefonico</label>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="text" name="nrotelefonico" class="form-control"
									id="nrotelefonico" value="${flash?.nrotelefonico}">
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="email">Email*</label>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="email" class="form-control" id="email" name="email"
									value="${flash?.email}" required="">
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="asunto">Asunto*</label>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="text" class="form-control" id="asunto"
									name="asunto" value="${flash?.asunto}" required="">
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="mensaje">Mensaje*</label>
						</div>
						<div class="col-md-4">
							<div class="form-group">

								<textarea style="width: 100%" name="mensaje" id="mensaje"
									rows="3" required="">
									${flash?.mensaje}
								</textarea>

							</div>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">
							<label for="asunto"></label>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<img
									src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}" />
								<br />
								<g:textField name="captcha" />
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>

					<button id="env" type="submit" class="btn btn-default">Enviar</button>
				</g:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('document').ready(function() {
			$('#env').prop('disabled', true);
			$('#captcha').on('keyup', function(element) {
				if ($('#captcha').val().length >= 6) {
					$('#env').prop('disabled', false);
				} else {
					$('#env').prop('disabled', true);
				}

			});
		})
		
		function getDatos(){
			$.ajax({
					type:'POST',
					url:"${requestContexPath}/portal-presidencia-0.1/contacto/getPersona",
					data: "nro="+$('#ci').val(),
					success:function(res){
							$('#nombre').val(res.data.nombre[0]);
							$('#apellido').val(res.data.apellido[0]);
						}
				});
		}
	</script>
</body>
</html>