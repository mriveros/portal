<!DOCTYPE html>
<html>
<head>
<meta name='layout' content='main-presidencia'>
<title><g:message code='default.show.label' args="${titulo}" /></title>
<script type='text/javascript'
	src="${resource(dir:'js',file:'smartpaginator.js') }"> </script>
<link href="${resource(dir:'css',file:'smartpaginator.css') }"
	rel='stylesheet' type='text/css'>
<style type='text/css'>
body {
	margin: 0 auto;
}
.div-inline{
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
.panel-primary,.panel{
	border-color: #9d9d9d !important;
}
.table{
	color:black;
}
</style>
</head>
<body>

	<header>
		<%-- Menu --%>
		<g:render template='menu'></g:render>
	</header>

	<div class='container-fluid '>
		<div class='row'>
			<div class='col-md-1'></div>
			<div class='col-md-10'>
				<ul class='nav nav-tabs'>
					<li class='active'> <a  data-toggle='tab' href='#documento' id='decreto' >Decretos</a> </li>
					<li > <a data-toggle='tab' href='#documento' id='circular' >Circulares</a> </li>
					<li > <a data-toggle='tab' href='#documento' id='resolucion' >Resoluciones</a> </li>
				</ul>
				<div class='tab-content' >
					<div id='documento' class='tab-pane fade in active' >
					<div class='panel panel-default'>
		<div class='panel-body' id='panelBody'>
			<div class='row'>
				<div class='panel panel-primary filterable'>
					<div class='panel-heading'>
						<h3 class='panel-title'>
							Listado
						</h3>
						<div class='pull-right'>
							<button class='btn btn-default btn-xs btn-filter'>
								<span class='glyphicon glyphicon-chevron-down'></span>
							</button>
						</div>
					</div>
					<table class='table table-striped table-hover'>
						<thead>
							<tr class='filters'>
								<th><input type='text' name='numero' class='form-control'
									placeholder='N&uacute;mero'></th>
								<th><input type='text' name='fecha' class='form-control'
									placeholder='Fecha'></th>
								<th><input type='text' name='descripcion'
									class='form-control' placeholder='Descripcion'></th>
								<th><input type='text' class='form-control'
									placeholder='Ver' disabled></th>
							</tr>
						</thead>
						<tbody id='tb_body'>
							<g:render template='table_documento'></g:render>
						</tbody>
					</table>
					<div class="row" style="text-align: center;">
						<div class="col-md-2" ></div>
						<div class="col-md-8" >
							<div id='ajax-load' style="display: none;">
							<img alt="cargando" src="${resource(dir:'images',file:'ajax-loader.gif')}">
							<p>Cargando datos...</p>
							</div>
						</div>
						<div class="col-md-8" ></div>
					</div>
				</div>
			</div>
		</div>
		<div class='panel-footer' style='height: 30%;'>
			<div style='width: 100%' id='panelFooter'></div>
		</div>
	</div>
					</div>
					 
				</div>
			</div>
			<div class='col-md-1'></div>
		</div>
	</div>
	<script type='text/javascript'>
		var tipo = "${tipo}";
		$('document').ready(function(){
			$('ul.nav-tabs li > a').each(function(pos,elm){
				var elmId = elm.id;
					$(elm).on('click',function(){
						    tipo = elmId;
						    $('#ajax-load').show();
							$.ajax({
								type:'POST',
								url: "${request.contextPath}/index/ajaxTabs",
								data:'tab='+elmId,
								success:function(rs){
									var list = rs.split('|');
									$('#tb_body').html(list[0]);
									initPaginador(list[1], list[2], 0);
									if (list[2] == '0') {
										$('#panelFooter').html('');
									}
									$('#ajax-load').hide();
								}
							});
					});
			});
		});
	
	$(document).ready(function(){
		    $('.filterable .btn-filter').click(function(){
		        var $panel = $(this).parents('.filterable'),
		        $filters = $panel.find('.filters input'),
		        $tbody = $panel.find('.table tbody');
		        if ($filters.prop('disabled') == false) {
		            $filters.prop('disabled', true);
		            $('span.glyphicon-chevron-down').addClass('glyphicon-chevron-up').removeClass('glyphicon-chevron-down');
		            $filters.first().focus();
		            $filters.last().prop('disabled', true);
		        } else {
			        
		        	$('span.glyphicon-chevron-up').addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
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

		});

		function getDatos(index){
			var dt='';
	        $('.filters input').each(function(k,v){
	          if(k<=2){
	            dt +=v.name+'=' + v.value+'&';
	            }
	        });
	        $('#ajax-load').show();
	        $.ajax({
					type:'POST',
					url:"${request.contextPath}/index/ajaxDocumentos",
					data:dt+'tipo='+ tipo + '&ind=' + index,
				success : function(rs) {
					var list = rs.split('|');
					$('#tb_body').html(list[0]);
					initPaginador(list[1], list[2], index);
					if (list[2] == '0') {
						$('#panelFooter').html('');
					}

					$('#ajax-load').hide();
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

