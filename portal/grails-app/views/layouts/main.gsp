<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Presidencia</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">--%>
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'style-row.css')}" type="text/css">
<script src="${resource(dir:'js',file:'jquery.js')}" type="text/javascript"></script>

<g:layoutHead />
<g:javascript library="application" />
<r:layoutResources />
<style type="text/css">
.div-row {
	display: table-row;
}

.div-cell {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.div-cell-tamanho {
	width: 15%;
}

.div-tamanho {
	width: 80%;
}

.text-left {
	text-align: left;
}
</style>


</head>
<body>
	<div id="grailsLogo" role="banner"
		style="height: 180px;background-repeat: none ;background-image: url(${resource(dir: 'images', file: 'bgcab.jpg')});">
		<img src="${resource(dir: 'images', file: 'Logo.png')}" alt="Grails"
			style="height: 150px;">
	</div>
	<g:layoutBody />
	<div class="footer" style="background-color: #123c4c"></div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<r:layoutResources />
</body>
</html>
