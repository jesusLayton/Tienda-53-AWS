
<%@include file="includes/header.jsp"%>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@include file="includes/sidebar.html"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<%@include file="includes/topbar.jsp"%>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="text-center">


						<div class="mb-5">
							<h1>VENTAS</h1>
							<hr>
						</div>

						<!-- CODE HERE -->
						
						
					
					<div id="error" class="alert alert-danger visually-hidden"
							role="alert">Error al mostrar el cliente, verifique que la
							cedula sean validos</div>

						<div id="correcto" class="alert alert-success visually-hidden"
							role="alert">cliente consultado con exito</div>


						<div class="row mb-2">

							<div class="col-md-6">
								<h4>Usuario</h4>
							</div>

								<div class="row mb-2">

									<div class="col-md-2">
										<label for="validationCustom01" class="form-label">Documento</label>
										<input onchange="solicitarusuario()" type="text"
											class="form-control" id="cedula_usuario" required>
									</div>


									<div class="col-md-5">
										<label for="validationCustom02" class="form-label">Nombre</label>
										<input type="text" class="form-control" id="nombre_usuario"
											disabled="disabled">
									</div>
									
									<div class="col-md-3"></div>
									
								</div>

								<hr>
								<div class="col-md-6">
								<h4>Cliente</h4>
							</div>
						</div>

						<div class="row mb-2">
						
							<div class="col-md-2">
								<label for="validationCustom01" class="form-label">Documento</label>
								<input onchange="solicitar()" type="text" class="form-control"
									id="validationCustom01" required>
							</div>
							
							<div class="col-md-5">
								<label for="validationCustom02" class="form-label">Nombre</label>
								<input type="text" class="form-control" id="nombre_cliente"
									disabled="disabled">
							</div>

						</div>

						<hr>

						<h4>Detalle de la Venta</h4>
						
						<div class="row mb-2">
						
							<div class="row mb-3">
													
								<div class="col-md-2">
									<label for="validationCustomUsername" class="form-label">Consecutivo</label>
									<input type="text" class="form-control text-center"
										id="consecutivo" aria-describedby="inputGroupPrepend" required disabled="disabled">
								</div>
							</div>
						</div>
						
						<form class="row g-3 needs-validation" novalidate>
						
							<div class="col-md-2">
								<label for="validationCustom03" class="form-label">Codigo
									del Producto</label> <input onchange="agregar1()" type="text"
									class="form-control" id="codigo_producto1" required>
							</div>

							<div class="col-md-5">
								<label for="validationCustom02" class="form-label">Nombre
									del Producto</label> <input type="text" class="form-control"
									id="nombre_producto" disabled="disabled">
							</div>

							<div class="col-md-1">
								<label for="validationCustom05" class="form-label">Cantidad</label>
								<input type="text" class="form-control" id="cantidad1" required
									onchange="calcular()">
							</div>
							
							<div class="col-md-2">
								<label for="validationCustom02" class="form-label">Valor Unitario</label> <input type="text" class="form-control"
									id="valorunitarioproducto" disabled="disabled">
							</div>
							
							<!--  
							
							<div class="col-md-2">
								<label for="validationCustom02" class="form-label">Valor Iva</label>
								<input type="text" class="form-control" id="iva_producto1" disabled="disabled">
							</div>
							-->

							<div class="col-md-2">
								<label for="validationCustom05" class="form-label">Valor Total</label> <input type="text" class="form-control" id="resultado1"
									required disabled="disabled">
							</div>


							<!-- esto es la fila 2 -->

							<div class="col-md-2">
								<input type="text" class="form-control" id="codigo_producto2" onchange="agregar2()" required>
							</div>

							<div class="col-md-5">
								<input type="text" class="form-control" id="nombre_producto2" disabled="disabled">
							</div>
							
							<div class="col-md-1">
								<input type="text" class="form-control" id="cantidad2" required onchange="calcular()">
							</div>

							<div class="col-md-2">
								<input type="text" class="form-control" id="valorunitarioproducto1" disabled="disabled">
							</div>
							
							<!--  
							
							<div class="col-md-2">
								<input type="text" class="form-control" id="iva_producto2" disabled="disabled">
							</div>
							
							-->
							
							<div class="col-md-2">
								<input type="text" class="form-control" id="resultado2" required disabled="disabled">
							</div>


							<!-- esto es la fila 3  -->

							<div class="col-md-2">
								<input type="text" class="form-control" id="codigo_producto3" onchange="agregar3()" required>
							</div>

							<div class="col-md-5">
								<input type="text" class="form-control" id="nombre_producto3" disabled="disabled">
							</div>
							
							<div class="col-md-1">
								<input type="text" class="form-control" id="cantidad3" required onchange="calcular()">
							</div>

							<div class="col-md-2">
								<input type="text" class="form-control" id="valorunitarioproducto2" disabled="disabled">
							</div>
							
							<!--  
							
							<div class="col-md-2">
								<input type="text" class="form-control" id="iva_producto3" disabled="disabled">
							</div>
							
							-->

							<div class="col-md-2">
								<input type="text" class="form-control" id="resultado3" required disabled="disabled">
							</div>


							<!-- esto es otra fila  -->


							<div class="row mt-5">
								<div class="col-md-8"></div>

								<label for="validationCustom05" class="form-label col-md-2">Sub Total Venta</label> <input type="text" class="form-control col-md-2"
									id="resultado4" disabled="disabled">

							</div>

							<div class="row mt-3">
								<div class="col-md-8"></div>

								<label for="validationCustom05" class="form-label col-md-2">Total IVA</label> <input type="text" class="form-control col-md-2"
									id="resultado5" disabled="disabled">
							</div>

							<div class="row mt-3">
								<hr>
								<div class="col-md-8"></div>
								<label for="validationCustom05" class="form-label col-md-2">TOTAL VENTA</label> <input type="text" class="form-control col-md-2"
									id="resultado6" disabled="disabled">
							</div>

							<div class="col-ms-2">
								<div class="col-md-10"></div>
								<button class="btn btn-primary col-md-2" type="submit" onclick="registrar()">Registrar Venta</button>
							</div>

						</form>


					<script>
					
					var getUrl = window.location;
					var baseUrl = getUrl.protocol + "//"+ getUrl.host + "/" + getUrl.pathname.split('/')[1];
					
						function solicitar() {

							var req = new XMLHttpRequest();
							var coincidencia = false;
							var cedula_cliente = document.getElementById("validationCustom01").value;
							req.open('GET', baseUrl + cedula_cliente, false);
							req.send(null);
							var cliente = null;
							if (req.status == 200)
								cliente = JSON.parse(req.responseText);
							console.log(JSON.parse(req.responseText));

							var element = document.getElementById("error");
							element.classList.add("visually-hidden");
							var element2 = document.getElementById("correcto");
							element2.classList.remove("visually-hidden");

							console.log(coincidencia);

							if (cliente.toString() != "") {

								document.getElementById("nombre_cliente").value = cliente[0].nombre_cliente;

							} else {

								var element = document.getElementById("error");
								element.classList.remove("visually-hidden");
								var element2 = document.getElementById("correcto");
								element2.classList.add("visually-hidden");
								document.getElementById("nombre_cliente").value = ""

							}

						}

						function agregar1() {

							var req = new XMLHttpRequest();
							var coincidencia = false;
							var codigo_producto = document.getElementById("codigo_producto1").value;
							req.open('GET',baseUrl + codigo_producto, false);
							req.send(null);
							var producto = null;
							if (req.status == 200)
								producto = JSON.parse(req.responseText);
							console.log(JSON.parse(req.responseText));

							var element = document.getElementById("error");
							element.classList.add("visually-hidden");
							var element2 = document
									.getElementById("correcto");
							element2.classList.remove("visually-hidden");

							console.log(coincidencia);

							if (producto.toString() != "") {

								document.getElementById("nombre_producto").value = producto[0].nombre_producto;
								document.getElementById("valorunitarioproducto").value = producto[0].precio_venta;
								/* document.getElementById("iva_producto1").value = producto[0].iva_compra; */


							} else {

								var element = document
										.getElementById("error");
								element.classList.remove("visually-hidden");
								var element2 = document
										.getElementById("correcto");
								element2.classList.add("visually-hidden");
								document.getElementById("nombre_producto").value = ""

							}

						}

						function agregar2() {

							var req = new XMLHttpRequest();
							var coincidencia = false;
							var codigo_producto = document.getElementById("codigo_producto2").value;
							req.open('GET',baseUrl + codigo_producto, false);
							req.send(null);
							var producto = null;
							if (req.status == 200)
								producto = JSON.parse(req.responseText);
							console.log(JSON.parse(req.responseText));

							var element = document.getElementById("error");
							element.classList.add("visually-hidden");
							var element2 = document.getElementById("correcto");
							element2.classList.remove("visually-hidden");

							console.log(coincidencia);

							if (producto.toString() != "") {

								document.getElementById("nombre_producto2").value = producto[0].nombre_producto;
								document.getElementById("valorunitarioproducto1").value = producto[0].precio_venta;
								/* document.getElementById("iva_producto2").value = producto[0].iva_compra; */

							} else {

								var element = document
										.getElementById("error");
								element.classList.remove("visually-hidden");
								var element2 = document
										.getElementById("correcto");
								element2.classList.add("visually-hidden");
								document.getElementById("nombre_producto2").value = ";"

							}

						}

						function agregar3() {

							var req = new XMLHttpRequest();
							var coincidencia = false;
							var codigo_producto = document
									.getElementById("codigo_producto3").value;
							req.open('GET', baseUrl + codigo_producto, false);
							req.send(null);
							var producto = null;
							if (req.status == 200)
								producto = JSON.parse(req.responseText);
							console.log(JSON.parse(req.responseText));

							var element = document.getElementById("error");
							element.classList.add("visually-hidden");
							var element2 = document.getElementById("correcto");
							element2.classList.remove("visually-hidden");

							console.log(coincidencia);

							if (producto.toString() != "") {

								document.getElementById("nombre_producto3").value = producto[0].nombre_producto;
								document.getElementById("valorunitarioproducto2").value = producto[0].precio_venta;
								/* document.getElementById("iva_producto3").value = producto[0].iva_compra; */

							} else {

								var element = document.getElementById("error");
								element.classList.remove("visually-hidden");
								var element2 = document.getElementById("correcto");
								element2.classList.add("visually-hidden");
								document.getElementById("nombre_producto3").value = ";"

							}

						}


						function calcular() {
		
							var num1 = parseInt(document.getElementById("valorunitarioproducto").value);
							var num2 = parseInt(document.getElementById("cantidad1").value);
	
							var num4 = parseInt(document.getElementById("valorunitarioproducto1").value);
							var num5 = parseInt(document.getElementById("cantidad2").value);

							var num7 = parseInt(document.getElementById("valorunitarioproducto2").value);
							var num8 = parseInt(document.getElementById("cantidad3").value);
							
							
							var num3 = (num1 * num2) + (num1 * num2 * 0.19);
							var num6 = (num4 * num5)+ (num4 * num5 * 0.19);
							var num9 = (num7 * num8 )+(num7 * num8 * 0.19);
							
							var subtotal = (num1 * num2)+(num4 * num5)+(num7 * num8);
							var totaliva = (num1 * num2 * 0.19)+(num4 * num5 * 0.19)+(num7 * num8 * 0.19);
							var totalcompra = subtotal + totaliva;

							// var total = num3+num6+mum9;

							console.log(num3);
							console.log(num6);
							console.log(num9);
							// console.log(total);
							

							document.getElementById("resultado1").value = num3;
							
							
							document.getElementById("resultado2").value = num6;
							
							
							document.getElementById("resultado3").value = num9;
							document.getElementById("resultado4").value = subtotal;
							document.getElementById("resultado5").value = totaliva;
							document.getElementById("resultado6").value = totalcompra;
							
							
							
							// document.getElementById("total").value=total;

						
						}

						
					/*	function suma() {
							var tota1 = parseInt(document
									.getElementById("resultado1").value);
							var tota2 = parseInt(document
									.getElementById("resultado2").value);

							var tota3 = parseInt(document
									.getElementById("resultado3").value);
							
							
							var sumatotal = tota1+tota2+tota3;
							var iva = sumatotal * 0.19;
							var totaliva = sumatotal + iva;
							
							console.log(sumatotal);
							console.log(iva);
							console.log(totaliva);
							
							document.getElementById("resultado4").value = sumatotal;
							document.getElementById("resultado5").value = iva;
							document.getElementById("resultado6").value = totaliva;
							
						}*/
						contarVenta(); 
						
						function contarVenta() {
							
							var req = new XMLHttpRequest();
							var consecutivo = document.getElementById("consecutivo");
							req.open('GET', 'http://localhost:8080/contarventas/', false);
							req.send(null);
							var cuenta = null;
							if (req.status == 200){
								resultado = JSON.parse(req.responseText);
								consecutivo.value = JSON.parse(req.responseText);
							}
							console.log(JSON.parse(req.responseText));

						}
						
						
						function solicitarusuario() {
							
							var req = new XMLHttpRequest();
							var coincidencia = false;
							var cedula_usuario = document.getElementById("cedula_usuario").value;
							req.open('GET', baseUrl + cedula_usuario, false);
							req.send(null);
							var usuario = null;
							if (req.status == 200)
								usuario = JSON.parse(req.responseText);
							console.log(JSON.parse(req.responseText));

							var element = document.getElementById("error");
							element.classList.add("visually-hidden");
							var element2 = document.getElementById("correcto");
							element2.classList.remove("visually-hidden");

							console.log(coincidencia);

							if (usuario.toString() != "") {

								document.getElementById("nombre_usuario").value = usuario[0].nombre_usuario;

							} else {

								var element = document.getElementById("error");
								element.classList.remove("visually-hidden");
								var element2 = document.getElementById("correcto");
								element2.classList.add("visually-hidden");
								document.getElementById("nombre_usuario").value = ""

							}

						}
						
						function registrar() {
							try {

								formData = new FormData();
								formData.append("codigo_venta", document.getElementById("consecutivo").value);
								formData.append("cedula_cliente", document.getElementById("validationCustom01").value);
								formData.append("cedula_usuario", document.getElementById("cedula_usuario").value);
								formData.append("iva_venta", document.getElementById("resultado5").value);
								formData.append("total_venta", document.getElementById("resultado6").value);
								formData.append("valor_venta", document.getElementById("resultado4").value);
								var xhr = new XMLHttpRequest();
								xhr.open("POST", "http://localhost:8080/registrarventa");
								xhr.send(formData);

								
								

							} catch (error) {
								var element = document.getElementById("error");
								element.classList.remove("visually-hidden");
								var element2 = document.getElementById("correcto");
								element2.classList.add("visually-hidden");
							}
							
							registrardetalleventa()

						}
						
					
								function registrardetalleventa() {
									
																		
									for (i = 1; i < 4; i++) {
										var actual = document.getElementById(("resultado" + i.toString()).value);
										if (actual == 0) {
											continue;
										} else {
											var formData2 = new FormData();
											
												
											formData2.append("codigo_detalle_venta", document.getElementById("consecutivo").value);
											
											formData2.append("cantidad_producto", document.getElementById("cantidad" + i.toString()).value);
											formData2.append("codigo_producto", document.getElementById("codigo_producto" + i.toString()).value);
											formData2.append("codigo_venta", document.getElementById("consecutivo").value);
											formData2.append("valor_total", document.getElementById("resultado" + i.toString()).value);
											formData2.append("valor_venta", document.getElementById("resultado4").value);
											formData2
												.append("valor_iva", document.getElementById("resultado5").value);
											var xhr2 = new XMLHttpRequest();
											xhr2.open("POST", baseUrl);
											xhr2.send(formData2);
										}

									}
									
									var element = document.getElementById("error");
									element.classList.add("visually-hidden");
									var element2 = document.getElementById("correcto");
									element2.classList.remove("visually-hidden");
								}
						
						
					
						//	function calcular1() {

						//	var req = new XMLHttpRequest();
						//	var coincidencia = false;
						//	var codigo_producto = document
						//			.getElementById("validationCustom07").value;
						//	req.open('GET',
						//			'http://localhost:8080/consultarProducto?codigo_producto='
						//					+ codigo_producto, false);
						//	req.send(null);
						//	var producto = null;
						//if (req.status == 200)
						//producto = JSON.parse(req.responseText);
						//console.log(JSON.parse(req.responseText));

						//	var valorunitario = parseFloat(producto[0].precio_venta);
						//	var cantidad2 = parseFloat(document.getElementById("cantidad2").value);

						//	var total = valorunitari * cantidad2;
						//console.log(total);
						//document.getElementById("valor_total2").value * total;

						//sumartotal();

						//var element = document.getElementById("error");
						//element.classList.add("visually-hidden");
						//var element2 = document
						//	.getElementById("correcto");
						//element2.classList.remove("visually-hidden");

						//	console.log(coincidencia);

						//	if (producto.toString() != "") {

						//		document.getElementById("nombre_producto3").value = producto[0].nombre_producto;

						//} else {

						//	var element = document
						/////			.getElementById("error");
						//	element.classList.remove("visually-hidden");
						//	var element2 = document
						//	.getElementById("correcto");
						//element2.classList.add("visually-hidden");
						//	document.getElementById("nombre_producto3").value = ";"

						///	}
						//}
					</script>


						<!-- END CODE HERE -->
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<%@include file="includes/footer.html"%>