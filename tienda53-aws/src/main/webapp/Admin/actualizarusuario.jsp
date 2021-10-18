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
	<h1>ACTUALIZAR USUARIO</h1>
	<hr>
</div>

<!-- CODE HERE -->

<div class="d-flex justify-content-center mb-5">
	<div class="col-5"> 
	

			<div id="error" class="d-none alert alert-danger"
				role="alert">Error al actualizar el usuario, verifique los datos
			</div>

			<form action="../actualizarUsuario" method="post">
			<div class="form-group">
				<label for="cedula_usuario">Cédula</label>
				<input type="text" id="cedula_usuario" readonly autocomplete="off" required name="cedula_usuario" class="form-control">
			</div>

			<div class="form-group">
				<label for="email_usuario">Email</label>
				<input type="email" id="email_usuario" autocomplete="off" required name="email_usuario" class="form-control">
			</div>
			<div class="form-group">
				<label for="nombre_usuario">Nombre</label>
				<input type="text" id="nombre_usuario" autocomplete="off" required name="nombre_usuario" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="usuario">usuario</label>
				<input type="text" id="usuario" autocomplete="off" required name="usuario" class="form-control">
			</div>
			<div class="form-group">
				<label for="password">Contraseña</label>
				<input type="password" id="password" autocomplete="off" required name="password" class="form-control">
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
		
		//var baseUrl = "http://localhost:8080/consultarUsuario/" + cedula;
		
		loadClientes();

		function loadClientes() {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseUrl, true);
			
						
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var usuario = JSON.parse(xmlhttp.responseText);
					
					console.log(usuario);
					
					document.getElementById("cedula_usuario").value = usuario[0].cedula_usuario;
					document.getElementById("email_usuario").value = usuario[0].email_usuario;
					document.getElementById("nombre_usuario").value = usuario[0].nombre_usuario;
					document.getElementById("usuario").value = usuario[0].usuario;
					document.getElementById("password").value = usuario[0].password;
					
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