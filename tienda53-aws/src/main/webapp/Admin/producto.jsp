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
		<h1>PRODUCTOS</h1>
		<hr>
	</div>


<!-- CODE HERE -->
	
	<!-- contenido  
	
	<div class="pb-3 pr-3 d-flex justify-content-end">
		 <a href="producto.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
		 <i class="fas fa-download fa-sm text-white-50"></i> Nuevo Producto</a>
		
	</div>
	-->
	
	<div class="pb-3 pr-3 d-flex justify-content-end">
		 <a href="cargarProductos.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
		 <i class="fas fa-download fa-sm text-white-50"></i> Cargar Productos</a>
		
	</div>
	
	<!-- 
	<div id="delete" class="d-none alert alert-danger" role="alert">
		Producto eliminado correctamente
	  </div>
	  
	  <div id="create" class="d-none alert alert-success" role="alert">
		Producto creado correctamente
	  </div>
	  
	  <div id="update" class="d-none alert alert-info" role="alert">
		Producto modificado correctamente
	  </div>
	
	 -->
	
	<!--  Aqui es donde se autogenera la tabla basado en el script -->
	<div class="col align-self-center">
		<table class='data-table table stripe hover nowrap'>
			<thead>
				<tr>
					<th class='table-plus'>Código</th>
					<th>Nit Proveedor</th>
					<th>Nombre del Producto</th>
					<th>Precio de Compra</th>
					<th>Iva Compra</th>
					<th>Precio de Venta</th>
					
				</tr>
			</thead>
			<tbody id="productosinfo">
			
			</tbody>
		</table>		
	</div>
	
	
<script>
	
	var getUrl = window.location;
	var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];
	
	//var baseurl = "http://localhost:8080/listarProductos";
	loadproductos();
	function loadproductos() {
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseUrl + "/listarProductos", true);
		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var productos = JSON.parse(xmlhttp.responseText);
				var main = "";

				for (i = 0; i < productos.length; i++) {
		
						main += "<tr><td>" + productos[i].codigo_producto
						+ "</td><td>" + productos[i].nit_proveedor
						+ "</td><td>" + productos[i].nombre_producto
						+ "</td><td>" + productos[i].precio_compra 
						+ "</td><td>" + productos[i].iva_compra
						+ "</td><td>" + productos[i].precio_venta + "</td>"
			
				}
				
				document.getElementById("productosinfo").innerHTML = main;
				
			}

		}
		xmlhttp.send();
	}
	
	<!-- 
	function eliminar(codigo){
		if(confirm("Seguro que desea eliminar el producto con código: " + codigo + "?")){
			window.location.replace("http://localhost:8080/eliminarProducto/" + codigo);
		}
	}
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	    results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var getVar = getParameterByName('delete');
	if (getVar == 1){
		document.getElementById("delete").classList.remove("d-none")
	}
	
	var getVar = getParameterByName('create');
	if (getVar == 1){
		document.getElementById("create").classList.remove("d-none")
	} 
	
	var getVar = getParameterByName('update');
	if (getVar == 1){
		document.getElementById("update").classList.remove("d-none")
	} 
	 -->
</script>
	
</div>
<!-- END CODE HERE -->

   </div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           