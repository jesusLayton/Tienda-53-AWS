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
	<h1>ACTUALIZAR PRODUCTO</h1>
	<hr>
</div>

<!-- CODE HERE -->


<div class="d-flex justify-content-center mb-5">
	<div class="col-5"> 
	

			<div id="error" class="d-none alert alert-danger"
				role="alert">Error al actualizar el producto, verifique los datos</div>

			<form id="actualizarProducto" action="../actualizarProducto" method="post">
			<div class="form-group">
				<label for="codigo_producto">Código</label>
				<input type="text" id="codigo_producto" readonly autocomplete="off" required name="codigo_producto" class="form-control">
			</div>
			<div class="form-group">
				<label for="nit_proveedor">Nit</label>
				<input type="text" id="nit_proveedor" autocomplete="off" required name="nit_proveedor" class="form-control">
			</div>
			<div class="form-group">
				<label for="nombre_producto">Nombre del Producto</label>
				<input type="text" id="nombre_producto" autocomplete="off" required name="nombre_producto" class="form-control">
			</div>
			<div class="form-group">
				<label for="precio_compra">Precio de Compra</label>
				<input type="text" id="precio_compra" autocomplete="off" required name="precio_compra" class="form-control">
			</div>
			<div class="form-group">
				<label for="iva_compra">IVA</label>
				<input type="text" id="iva_compra" autocomplete="off" required name="iva_compra" class="form-control">
			</div>
			<div class="form-group">
				<label for="precio_venta">Valor Venta</label>
				<input type="text" id="precio_venta" autocomplete="off" required name="precio_venta" class="form-control">
			</div>
			<div class="form-group mt-3">
				<input type="submit" value="Enviar" class="btn btn-primary form-control">
			</div>
		</form>
		
		</div>

	</div>
	
	<script>
		var codigo = getParameterByName('codigo');
		
		//var baseurl = "http://localhost:8080/consultarProducto/" + codigo;
		var getUrl = window.location;
		var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];
		
		loadProductos();

		function loadProductos() {		
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", baseUrl, true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					var producto = JSON.parse(xmlhttp.responseText);
					document.getElementById("codigo_producto").value = producto[0].codigo_producto;
					document.getElementById("iva_compra").value = producto[0].iva_compra;
					document.getElementById("nit_proveedor").value = producto[0].nit_proveedor;
					document.getElementById("nombre_producto").value = producto[0].nombre_producto;
					document.getElementById("precio_compra").value = producto[0].precio_compra;
					document.getElementById("precio_venta").value = producto[0].precio_venta;

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