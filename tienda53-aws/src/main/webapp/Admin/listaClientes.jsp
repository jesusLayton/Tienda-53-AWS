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
		<h1>LISTADO GENERAL DE CLIENTES</h1>
		<hr>
	</div>


<!-- CODE HERE -->
	
	
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
							+ "</td><td>" + clientes[i].telefono_cliente + "</td>";
				}
				document.getElementById("clientesinfo").innerHTML = main;
			}
		};
		xmlhttp.send();
	}
	


	
</script>

</div>
<!-- END CODE HERE -->

   </div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           