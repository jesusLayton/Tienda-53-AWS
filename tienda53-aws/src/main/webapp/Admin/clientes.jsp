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
		<h1>CLIENTES</h1>
		<hr>
	</div>


<!-- CODE HERE -->
	
	<!-- contenido  -->
	
	
			
	<div class="pb-3 pr-3 d-flex justify-content-end">
		 <a href="nuevoCliente.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
		 <i class="fas fa-download fa-sm text-white-50"></i> Nuevo Cliente</a>
		
	</div>
	
      <div id="delete" class="d-none alert alert-danger" role="alert">
		Cliente eliminado correctamente
	  </div>
	  
	  <div id="create" class="d-none alert alert-success" role="alert">
		Cliente creado correctamente
	  </div>
	  
	  <div id="update" class="d-none alert alert-info" role="alert">
		Cliente modificado correctamente
	  </div>

	
	<!--  Aqui es donde se autogenera la tabla basado en el script -->
	<div class="col align-self-center">
		<table id="tabla" class='data-table table stripe hover nowrap'>
			<thead>
				<tr>
					<th class='table-plus'>Nit</th>
					<th>Nombre</th>
					<th>Dirección</th>
					<th>Email</th>
					<th>Teléfono</th>
					<th class='datatable-nosort'>Editar</th>
					<th class='datatable-nosort'>Eliminar</th>
				</tr>
			</thead>
			<tbody id="clientesinfo">
			
			</tbody>
		</table>	
	</div>
	
<script>
	var getUrl = window.location;
	var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];

	 loadClientes();

	 function loadClientes() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseUrl + '/listarclientes', true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var clientes = JSON.parse(xmlhttp.responseText);
				var main = "";
				for (i = 0; i < clientes.length; i++) {
					main += "<tr><td>" + clientes[i].cedula_cliente
							+ "</td><td>" + clientes[i].nombre_cliente
							+ "</td><td>" + clientes[i].direccion_cliente
							+ "</td><td>" + clientes[i].email_cliente
							+ "</td><td>" + clientes[i].telefono_cliente + "</td>"
							+ "<td><a href='actualizarcliente.jsp?cedula=" + clientes[i].cedula_cliente + "'><i class='fas fa-pen'></i></a></td>"
							+ "<td><a onclick='eliminar(" + clientes[i].cedula_cliente + ")'><i class='fas fa-trash'></i></a></td></tr>";
				}
				document.getElementById("clientesinfo").innerHTML = main;
			}
		};
		xmlhttp.send();
	}
	
	function eliminar(cedula){
		if(confirm("Seguro que desea eliminar el cliente con cedula: " + cedula + "?")){
			window.location.replace(baseUrl + "/eliminarcliente/" + cedula);
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

	
</script>

</div>
<!-- END CODE HERE -->

   </div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           