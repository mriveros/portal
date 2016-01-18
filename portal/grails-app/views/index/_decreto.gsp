<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main-presidencia">
<title><g:message code="default.show.label" args="${titulo}" /></title>
<script type="text/javascript"
	src="${resource(dir:'js',file:'smartpaginator.js') }"> </script>
<link href="${resource(dir:'css',file:'smartpaginator.css') }"
	rel="stylesheet" type="text/css">
<style type="text/css">
body {
	margin: 0 auto;
}

.div-inline {
	display: inline;
	font-size: 10px;
}

.filterable {
	margin-top: 15px;
}

.filterable .panel-heading .pull-right {
	margin-top: -20px;
}

.filterable .filters input[disabled] {
	background-color: transparent;
	border: none;
	cursor: auto;
	box-shadow: none;
	padding: 0;
	height: auto;
}

.filterable .filters input[disabled]::-webkit-input-placeholder {
	color: #333;
}

.filterable .filters input[disabled]::-moz-placeholder {
	color: #333;
}

.filterable .filters input[disabled]:-ms-input-placeholder {
	color: #333;
}

.btn-default:hover {
	color: #333 !important;
	background-color: #e6e6e6 !important;
	border-color: #adadad !important;
}

.panel-heading {
	background-color: #9d9d9d !important;
	border-color: #9d9d9d !important;
	color: #fff;
}

.panel-primary, .panel {
	border-color: #9d9d9d !important;
}

.table {
	color: black;
}
</style>
</head>
<body>




	<div class="panel panel-default">
		<div class="panel-body" id="panelBody">
			<div class="row">
				<div class="panel panel-primary filterable">
					<div class="panel-heading">
						<h3 class="panel-title">
							Listado de
							${tipo}
						</h3>
						<div class="pull-right">
							<button class="btn btn-default btn-xs btn-filter">
								<span class="glyphicon glyphicon-chevron-down"></span>
							</button>
						</div>
					</div>
					<table class="table table-striped table-hover">
						<thead>
							<tr class="filters">
								<th><input type="text" name="numero" class="form-control"
									placeholder="N&uacute;mero"></th>
								<th><input type="text" name="fecha" class="form-control"
									placeholder="Fecha"></th>
								<th><input type="text" name="descripcion"
									class="form-control" placeholder="Descripcion"></th>
								<th><input type="text" class="form-control"
									placeholder="Ver" disabled></th>
							</tr>
						</thead>
						<tbody id="tb_body">
							<g:render template="table_documento"></g:render>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="panel-footer" style="height: 30%;">
			<div style="width: 100%" id="panelFooter"></div>
		</div>
	</div>
	<div class="col-md-1"></div>

	<script type="text/javascript">
	
		//$(document).ready(function(){
		    $('.filterable .btn-filter').click(function(){
		        var $panel = $(this).parents('.filterable'),
		        $filters = $panel.find('.filters input'),
		        $tbody = $panel.find('.table tbody');
		        if ($filters.prop('disabled') == false) {
		            $filters.prop('disabled', true);
		            $("span.glyphicon-chevron-down").addClass('glyphicon-chevron-up').removeClass('glyphicon-chevron-down');
		            $filters.first().focus();
		            $filters.last().prop('disabled', true);
		        } else {
			        
		        	$("span.glyphicon-chevron-up").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
		            $filters.val('').prop('disabled', false);
		            $filters.last().prop('disabled', true);  
		        }
		    });

		    $('.filterable .filters input').keyup(function(e){
		        /* Ignore tab key */
		        var code = e.keyCode || e.which;
		        if (code == '9') return;
		        getDatos(0);
		    });
		    getDatos(0);

		//});

		function getDatos(index){
			var dt="";
	        $(".filters input").each(function(k,v){
	          if(k<=2){
	            dt +=v.name+'=' + v.value+'&';
	            }
	        });
	        $.ajax({
					type:'POST',
					url:"ajaxDocumentos",
					data:dt+"tipo=${tipo}" + "&ind=" + index,
				success : function(rs) {
					var list = rs.split("|");
					$("#tb_body").html(list[0]);
					initPaginador(list[1], list[2], index);
					if (list[2] == "0") {
						$('#panelFooter').html("");
					}
				}
			})

		}
		function initPaginador(cantPag, cantReg, current) {

			$('#panelFooter').smartpaginator({
				totalrecords : parseInt(cantReg),
				recordsperpage : parseInt(cantPag),
				length : 5,
				theme : 'red',
				next : 'Siguiente',
				prev : 'Anterior ',
				first : 'Primero',
				last : 'Ultimo',
				go : 'Ir a',
				initval : current,
				controlsalways : true,
				onchange : function(newPage) {
					getDatos(newPage);
				}
			});
		}
	</script>
</body>
</html>
