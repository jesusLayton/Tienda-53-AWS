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
		<h1>LISTADO GENERAL DE USUARIOS</h1>
		<hr>
	</div>


<!-- CODE HERE -->
	
	
	<!--  Aqui es donde se autogenera la tabla basado en el script -->
	<div class="col align-self-center">
		<table class='data-table table stripe hover nowrap'>
			<thead>
				<tr>
					<th class='table-plus'>Cedula</th>
					<th>Nombre</th>
					<th>Email</th>
					<th>Password</th>
					<th>Usuario</th>
				</tr>
			</thead>
			<tbody id="usuariosinfo">
			
			</tbody>
		</table>		
	</div>
	
	
<script>
	var getUrl = window.location;
	var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];
	loadusuarios();
	function loadusuarios() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseUrl + '/listarUsuarios', true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var usuarios = JSON.parse(xmlhttp.responseText);
				var main = "";
				for (i = 0; i < usuarios.length; i++) {
					main += "<tr><td>" + usuarios[i].cedula_usuario
							+ "</td><td>" + usuarios[i].nombre_usuario
							+ "</td><td>" + usuarios[i].email_usuario
							+ "</td><td>" + usuarios[i].password 
							+ "</td><td>" + usuarios[i].usuario + "</td>";
					}
				document.getElementById("usuariosinfo").innerHTML = main;
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