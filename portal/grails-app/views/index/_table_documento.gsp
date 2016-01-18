<%@page import="py.org.presidencia.PresidenciaService"%>
<g:if test="${listado}">
	<g:each var="entidad" in="${listado}">
		<tr>
			<td>
				${entidad.numero}
			</td>
			<td><g:formatDate date="${entidad.fecha}" format="yyyy-MM-dd" /></td>
			<td>
				${PresidenciaService.getSubString(entidad.descripcion)}
			</td>
			<td><g:link target="_blank" action="getDocumento" id="${entidad.id}">
					<span class="glyphicon glyphicon-search"></span>
				</g:link></td>
		</tr>
	</g:each>
	|${cantPag}|${cantReg}|${cantRegView}
</g:if>
<g:else>
	<tr>
		<td colspan="4">
			No se ha encontrado registros
		</td>
	</tr>
	<g:if test="${cantPag}">
		|${cantPag}|${cantReg}|${cantRegView}
	</g:if>
	
</g:else>