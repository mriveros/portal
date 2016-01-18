
<%@ page import="py.org.presidencia.Noticia"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'noticia.label', default: 'Noticia')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'jpstyle.css')}" type="text/css">
<script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.3.2.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.paginate.js')}"></script>

</head>
<body>
	<a href="#list-noticia" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/administracion/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-noticia" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div id="pag_data">
			<g:render template="table"></g:render>
		</div>
		<div class="pagination">
			<div id="pag_id"></div>
		</div>
	</div>
	<script type="text/javascript">
	
		function cargaDatos(pages){
				$.ajax({
						url:"${request.contextPath}/noticia/ajaxGetLista",
						data:"max=${cantPaginacion}&pagina="+pages,
						type:"POST",
						success:function(resp){
							$("#pag_data").html(resp);	
						}
					});
			};
		$('document').ready(function(){
				if(parseInt("${registro}") > parseInt("${cantPaginacion}") ){
					startPg();
				}
		});
		function startPg(){
				$("#pag_id").paginate({
				count: "${noticiaInstanceCount}",
				start : 1,
				display : parseInt("${cantPaginacion}"),
				border : true,
				border_color : '#fff',
				text_color : '#fff',
				background_color : 'black',
				border_hover_color : '#ccc',
				text_hover_color : '#000',
				background_hover_color : '#fff',
				images : false,
				mouse : 'press',
				onChange : function(page) {
					cargaDatos(page)
				}
			});
		};
	</script>
</body>
</html>
