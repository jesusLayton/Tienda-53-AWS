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
		<h1>PROVEEDORES</h1>
		<hr>
	</div>


<!-- CODE HERE -->
	
	<!-- contenido  -->
	
	
			
	<div class="pb-3 pr-3 d-flex justify-content-end">
		 <a href="nuevoProveedor.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
		 <i class="fas fa-download fa-sm text-white-50"></i> Nuevo Proveedor</a>
		
	</div>
	
      <div id="delete" class="d-none alert alert-danger" role="alert">
		Proveedor eliminado correctamente
	  </div>
	  
	  <div id="create" class="d-none alert alert-success" role="alert">
		Proveedor creado correctamente
	  </div>
	  
	  <div id="update" class="d-none alert alert-info" role="alert">
		Proveedor modificado correctamente
	  </div>
	  <div id="error" class="d-none alert alert-warning" role="alert">
		Proveedor no pudo ser eliminado.
	  </div>

	
	<!--  Aqui es donde se autogenera la tabla basado en el script -->
	<div class="col align-self-center">
		<table id="tabla" class='data-table table stripe hover nowrap'>
			<thead>
				<tr>
					<th class='table-plus'>Nit</th>
					<th>Nombre</th>
					<th>Dirección</th>
					<th>Ciudad</th>
					<th>Teléfono</th>
					<th class='datatable-nosort'>Editar</th>
					<th class='datatable-nosort'>Eliminar</th>
				</tr>
			</thead>
			<tbody id="proveedoresinfo">
			
			</tbody>
		</table>	
	</div>
	
<script>
	var getUrl = window.location;
	var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];
	//var baseurl = "http://localhost:8080/listarProveedores";
	loadproveedores();
	function loadproveedores() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseUrl + "/listarProveedores", true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var proveedores = JSON.parse(xmlhttp.responseText);
				var main = "";
				for (i = 0; i < proveedores.length; i++) {
					main += "<tr><td>" + proveedores[i].nit_proveedor
							+ "</td><td>" + proveedores[i].nombre_proveedor
							+ "</td><td>" + proveedores[i].direccion_proveedor
							+ "</td><td>" + proveedores[i].ciudad_proveedor
							+ "</td><td>" + proveedores[i].telefono_proveedor + "</td>"
							+ "<td><a href='actualizarProveedor.jsp?nit=" + proveedores[i].nit_proveedor + "'><i class='fas fa-pen'></i></a></td>"
							+ "<td><a onclick='eliminar(" + proveedores[i].nit_proveedor + ")'><i class='fas fa-trash'></i></a></td></tr>";
				}
				document.getElementById("proveedoresinfo").innerHTML = main;
			}
		};
		xmlhttp.send();
	}
	
	function eliminar(nit){
		if(confirm("Seguro que desea eliminar el proveedor con Nit: " + nit + "?")){
			window.location.replace(baseUrl + "/eliminarProveedor/" + nit);
		}
	}
		
	var getVar = getParameterByName('delete');
	console.log(getVar);
	if (getVar == "1"){
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
	
	var getVar = getParameterByName('error');
	if (getVar == 1){
		document.getElementById("error").classList.remove("d-none")
	} 

	
</script>

</div>
<!-- END CODE HERE -->

   </div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           