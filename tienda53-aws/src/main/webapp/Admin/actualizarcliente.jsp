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
	<h1>ACTUALIZAR CLIENTE</h1>
	<hr>
</div>

<!-- CODE HERE -->


<div class="d-flex justify-content-center mb-5">
	<div class="col-5"> 
	

			<div id="error" class="d-none alert alert-danger"
				role="alert">Error al actualizar el cliente, verifique los datos</div>

			<form id="registrarcliente" action="../actualizarclientes" method="post">
			<div class="form-group">
				<label for="cedula_cliente">Nit</label>
				<input type="text" id="cedula_cliente" readonly autocomplete="off" required name="cedula_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="nombre_cliente">Nombre</label>
				<input type="text" id="nombre_cliente" autocomplete="off" required name="nombre_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="direccion_cliente">Dirección</label>
				<input type="text" id="direccion_cliente" autocomplete="off" required name="direccion_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="email_cliente">Email</label>
				<input type="email" id="email_cliente" autocomplete="off" required name="email_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="telefono_cliente">Teléfono</label>
				<input type="text" id="telefono_cliente" autocomplete="off" required name="telefono_cliente" class="form-control">
			</div>
			<div class="form-group mt-3">
				<input type="submit" value="Enviar" class="btn btn-primary form-control">
			</div>
		</form>
		
		</div>

	</div>
	
	<script>
		var cedula = getParameterByName('cedula');
		
		var getUrl = window.location;
		var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];
		
		
		loadClientes();

		function loadClientes() {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseUrl + "consultarcliente/" + cedula, true);
			
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var cliente = JSON.parse(xmlhttp.responseText);
					
					document.getElementById("cedula_cliente").value = cliente[0].cedula_cliente;
					document.getElementById("nombre_cliente").value = cliente[0].nombre_cliente;
					document.getElementById("direccion_cliente").value = cliente[0].direccion_cliente;
					document.getElementById("email_cliente").value = cliente[0].email_cliente;
					document.getElementById("telefono_cliente").value = cliente[0].telefono_cliente;
					
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