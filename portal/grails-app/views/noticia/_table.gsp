<%@page import="py.org.presidencia.PresidenciaService"%>
<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'noticia.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="hora" title="${message(code: 'noticia.hora.label', default: 'Hora')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'noticia.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="subTitulo" title="${message(code: 'noticia.subTitulo.label', default: 'Sub Titulo')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'noticia.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="permanente" title="${message(code: 'noticia.permanente.label', default: 'Permanente')}" />
						
						<g:sortableColumn property="slider" title="${message(code: 'noticia.permanente.label', default: 'Slider')}" />
						
						<g:sortableColumn property="destacado" title="${message(code: 'noticia.permanente.label', default: 'Destacado')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${noticiaInstanceList}" status="i" var="noticiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${noticiaInstance.id}"><g:formatDate date="${noticiaInstance.fecha}" format="dd/MM/yyyy"/></g:link></td>
					
						<td><g:formatDate date="${noticiaInstance.hora}" format="HH:mm"/></td>
					
						<td>${PresidenciaService.getSubString(noticiaInstance.titulo,50).encodeAsRaw()}</td>
					
						<td>${PresidenciaService.getSubString(noticiaInstance.subTitulo,50).encodeAsRaw()}</td>
					
						<td>${PresidenciaService.getSubString(noticiaInstance.descripcion,50).encodeAsRaw()}</td>
					
						<td><g:if test="${noticiaInstance.permanente }">Si</g:if><g:else>No</g:else></td>
						
						<td><g:if test="${noticiaInstance.slider }">Si</g:if><g:else>No</g:else></td>
						
						<td><g:if test="${noticiaInstance.destacado }">Si</g:if><g:else>No</g:else></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>