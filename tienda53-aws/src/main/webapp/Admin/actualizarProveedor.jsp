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

	
<div class="mb-5"> 
	<h1>ACTUALIZAR PROVEEDOR</h1>
	<hr>
</div>

<!-- CODE HERE -->


<div class="d-flex justify-content-center mb-5">
	<div class="col-5"> 
	

			<div id="error" class="d-none alert alert-danger"
				role="alert">Error al actualizar el Proveedor, verifique los datos</div>

			<form id="actualizarproveedor" action="../actualizarProveedor" method="post">
			<div class="form-group">
				<label for="nit_proveedor">Nit</label>
				<input type="text" id="nit_proveedor" readonly autocomplete="off" required name="nit_proveedor" class="form-control">
			</div>
			<div class="form-group">
				<label for="nombre_proveedor">Nombre</label>
				<input type="text" id="nombre_proveedor" autocomplete="off" required name="nombre_proveedor" class="form-control">
			</div>
			<div class="form-group">
				<label for="direccion_proveedor">Dirección</label>
				<input type="text" id="direccion_proveedor" autocomplete="off" required name="direccion_proveedor" class="form-control">
			</div>
			<div class="form-group">
				<label for="ciudad_proveedor">Ciudad</label>
				<input type="text" id="ciudad_proveedor" autocomplete="off" required name="ciudad_proveedor" class="form-control">
			</div>
			<div class="form-group">
				<label for="telefono_proveedor">Teléfono</label>
				<input type="text" id="telefono_proveedor" autocomplete="off" required name="telefono_proveedor" class="form-control">
			</div>
			<div class="form-group mt-3">
				<input type="submit" value="Enviar" class="btn btn-primary form-control">
			</div>
		</form>
		
		</div>

	</div>
	
	<script>
		var nit = getParameterByName('nit');
		
		var getUrl = window.location;
		var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];
		
		//var baseurl = "http://localhost:8080/consultarProveedor/" + nit;
		loadProveedores();

		function loadProveedores() {		
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseUrl + "consultarProveedor/" + nit , true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var proveedor = JSON.parse(xmlhttp.responseText);
					document.getElementById("nit_proveedor").value = proveedor[0].nit_proveedor;
					document.getElementById("nombre_proveedor").value = proveedor[0].nombre_proveedor;
					document.getElementById("direccion_proveedor").value = proveedor[0].direccion_proveedor;
					document.getElementById("ciudad_proveedor").value = proveedor[0].ciudad_proveedor;
					document.getElementById("telefono_proveedor").value = proveedor[0].telefono_proveedor;
					
				}
			};
			xmlhttp.send();
		}
		
		var getVar = getParameterByName('error');
		if (getVar == "1"){
			document.getElementById("error").classList.remove("d-none")
		}
		
		
	</script>

</body>
</html>



<!-- END CODE HERE -->
</div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           