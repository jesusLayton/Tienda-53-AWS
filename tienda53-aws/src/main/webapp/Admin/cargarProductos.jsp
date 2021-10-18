<%@include  file="includes/header.jsp" %>
<body id="page-top">
	
<!-- Page Wrapper -->
<div id="wrapper">

<%@include  file="includes/sidebar.html" %>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

<%@include  file="includes/topbar.jsp" %>
<!-- Begin Page Content -->
<div class="container-fluid">
<div class="text-center"> 

<div class="text-center"> 
	<div class="mb-5"> 
		<h1>CARGAR PRODUCTOS</h1>
		<hr>
	</div>

<!-- CODE HERE -->

<div class="d-flex justify-content-center mb-5">
	<div class="col-5"> 
	
	<!-- <div id="error" class="d-none alert alert-danger"
				role="alert">Producto ya se encuentra registrado</div>
				
	-->

				
		<form>
			
						
					
			<div class="form-group mt-3">
				<input id = "archivo" type="file" accept = ".csv" value="Seleccionar Archivo" required class="btn btn-primary form-control">
				
			</div>
			
			<div class="form-group mt-3">
				<button class="btn btn-primary form-control" onclick = "cargarArchivo()">Cargar Archivo</button>
			</div>
			<div class="form-group">
				<label for="codigo_producto">Solo admite archivo .csv</label>
			</div>
		</form>
			
	</div>		
</div>

<script>

	var getUrl = window.location;
	var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];

	function cargarArchivo() {
	
	var csvFile = document.getElementById("archivo");
	
	
	
	var input = csvFile.files[0];
	var reader = new FileReader();
			
	reader.onload = async function(e) {
		
		var text = e.target.result;
		var arrayLineas = text.split("\n");
		
		var xhr = new XMLHttpRequest();
		xhr.open("DELETE", baseUrl, true);
		xhr.send();

		alert("Datos Eliminados");
		
		for (var i = 0; i < arrayLineas.length; i+=1) {
			

			
			var arraydatos = arrayLineas[i].split(",");
			
			if (arrayLineas[i] == "") {
				continue
			}
		
			
			for (var j = 0; j < arraydatos.length; j += 1) {
				console.log (i + " " + j + "->" + arraydatos[j]);
			}
		
			<!--alert(arraydatos[1]);-->
			
			var formData = new FormData();
			formData.append("codigo_producto", arraydatos[0]);
			formData.append("nombre_producto", arraydatos[1]);
			formData.append("nit_proveedor", arraydatos[2]);
			formData.append("precio_compra", arraydatos[3]);
			formData.append("iva_compra", arraydatos[4]);
			formData.append("precio_venta", arraydatos[5]);
			
			var xhr = new XMLHttpRequest();
			xhr.open("POST", baseUrl);
			
			xhr.send(formData);
			
			
		}
		alert(arrayLineas.length);
	}

	reader.readAsText(input);

}
		
</script>

<!-- END CODE HERE -->
</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           