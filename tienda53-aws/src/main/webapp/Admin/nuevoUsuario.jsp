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
		<h1>NUEVO USUARIO</h1>
		<hr>
	</div>

<!-- CODE HERE -->

<div class="d-flex justify-content-center mb-5">
	<div class="col-5"> 
	
	
	<div id="error" class="d-none alert alert-danger"
				role="alert">El usuario ya existe</div>

	
		<form id="registrarUsuario" action="../registrarUsuario" method="post">
			<div class="form-group">
				<label for="cedula_usuario">Cédula</label>
				<input type="text" autocomplete="off" name="cedula_usuario" class="form-control">
			</div>
			<div class="form-group">
				<label for="email_usuario">Email</label>
				<input type="email" autocomplete="off" name="email_usuario" class="form-control">
			</div>
			<div class="form-group">
				<label for="nombre_usuario">Nombre</label>
				<input type="text" autocomplete="off" name="nombre_usuario" class="form-control">
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" autocomplete="off" name="password" class="form-control">
			</div>
			<div class="form-group">
				<label for="usuario">Usuario</label>
				<input type="text" autocomplete="off" name="usuario" class="form-control">
			</div>
			<div class="form-group mt-3">
				<input type="submit" value="Enviar" class="btn btn-primary form-control">
			</div>
		</form>
			
	</div>	
		
</div>


<script>

var getVar = getParameterByName('error');
if (getVar == 1){
	document.getElementById("error").classList.remove("d-none")
} 
</script>

<!-- END CODE HERE -->
</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           