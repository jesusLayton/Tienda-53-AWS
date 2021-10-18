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
		<h1>NUEVO CLIENTE</h1>
		<hr>
	</div>

<!-- CODE HERE -->

<div class="d-flex justify-content-center mb-5">
	<div class="col-5"> 
	
	<div id="error" class="d-none alert alert-danger"
				role="alert">Cliente ya se encuentra registrado</div>

				
		<form id="registrarcliente" action="../registrarcliente" method="post">
			<div class="form-group">
				<label for="cedula_cliente">Cédula</label>
				<input type="text" autocomplete="off" required name="cedula_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="nombre_cliente">Nombre</label>
				<input type="text" autocomplete="off" required name="nombre_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="direccion_cliente">Dirección</label>
				<input type="text" autocomplete="off" required  name="direccion_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="email_cliente">Email</label>
				<input type="email" autocomplete="off" required name="email_cliente" class="form-control">
			</div>
			<div class="form-group">
				<label for="telefono_cliente">Teléfono</label>
				<input type="text" autocomplete="off" required name="telefono_cliente" class="form-control">
			</div>
			<div class="form-group mt-3">
				<input type="submit" value="Enviar" required class="btn btn-primary form-control">
			</div>
		</form>
			
	</div>		
</div>

<script>

var getVar = getParameterByName('error');
	if (getVar == 1){
	document.getElementById("error").classList.remove("d-none");
} 
</script>

<!-- END CODE HERE -->
</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           