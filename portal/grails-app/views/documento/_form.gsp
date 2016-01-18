<%@ page import="py.org.presidencia.Documento" %>


<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="documento.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField size="60" name="descripcion" value="${documentoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="documento.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${documentoInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="documento.numero.label" default="Numero" />
		
	</label>
	<g:textField name="numero" value="${documentoInstance?.numero}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="documento.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${py.org.presidencia.TipoDocumento.list()}" optionKey="id" required="" value="${documentoInstance?.tipo?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentoInstance, field: 'adjunto', 'error')} required">
	<label for="adjunto">
		<g:message code="documento.adjunto.label" default="Adjunto" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="adjunto" name="adjunto" accept="pdf"/>
	<input type="hidden" id="resumen" name="resumen" />
</div>
<g:javascript src="spark-md5.min.js"></g:javascript>
<g:javascript>
			document.getElementById("adjunto").addEventListener("change", function() {
				var blobSlice = File.prototype.slice || File.prototype.mozSlice || File.prototype.webkitSlice,
					file = this.files[0],
					chunkSize = 2097152, // read in chunks of 2MB
					chunks = Math.ceil(file.size / chunkSize),
					currentChunk = 0,
					spark = new SparkMD5.ArrayBuffer(),
					frOnload = function(e){
						spark.append(e.target.result); // append array buffer
						currentChunk++;
						if (currentChunk < chunks){
							loadNext();
						}else{
						 $("#resumen").val("");
						 $("#resumen").val(spark.end());
						 }
					},
					frOnerror = function () {
					};
				function loadNext() {
					var fileReader = new FileReader();
					fileReader.onload = frOnload;
					fileReader.onerror = frOnerror;
					var start = currentChunk * chunkSize,
						end = ((start + chunkSize) >= file.size) ? file.size : start + chunkSize;
					fileReader.readAsArrayBuffer(blobSlice.call(file, start, end));
				};		
				loadNext();
			});
</g:javascript>


