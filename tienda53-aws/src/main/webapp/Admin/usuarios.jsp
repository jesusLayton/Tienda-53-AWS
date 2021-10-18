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
		<h1>USUARIOS</h1>
		<hr>
	</div>


<!-- CODE HERE -->
	
	<!-- contenido  -->
	
	<div class="pb-3 pr-3 d-flex justify-content-end">
		 <a href="nuevoUsuario.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
		 <i class="fas fa-download fa-sm text-white-50"></i> Nuevo Usuario</a>
		
	</div>
	
	<div id="delete" class="d-none alert alert-danger" role="alert">
		Usuario eliminado correctamente
	  </div>
	  
	  <div id="create" class="d-none alert alert-success" role="alert">
		Usuario creado correctamente
	  </div>
	  
	  <div id="update" class="d-none alert alert-info" role="alert">
		Usuario modificado correctamente
	  </div>
	
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
					<th class='datatable-nosort'>Editar</th>
					<th class='datatable-nosort'>Eliminar</th>
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
							+ "</td><td>" + usuarios[i].usuario + "</td>"
							+ "<td><a href='actualizarusuario.jsp?cedula=" + usuarios[i].cedula_usuario + "'><i class='fas fa-pen'></i></a></td>"
							+ "<td><a onclick='eliminar(" + usuarios[i].cedula_usuario + ")'><i class='fas fa-trash'></i></a></td></tr>";
				}
				document.getElementById("usuariosinfo").innerHTML = main;
			}
		};
		xmlhttp.send();
	}

	function eliminar(cedula){
		if(confirm("Seguro que desea eliminar el usuario con cedula: " + cedula + "?")){
			window.location.replace(baseUrl + 'eliminarUsuario/' + cedula);
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
</script>
	
</div>
<!-- END CODE HERE -->

   </div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include  file="includes/footer.html" %>           