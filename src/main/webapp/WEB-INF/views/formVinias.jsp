<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/estilos.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/slider.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/secciones.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<style>
#map {
	width: 100%;
	height: 50%;
	margin-top: 150;
}
</style>
</head>

<body style="background-image: url('https://images.alphacoders.com/168/168613.jpg');">
	<%@include file="authheader.jsp"%>
	<section>
	<div class="container" style="margin-left: 150px;">
		<div class="formulario">
				<div class="row" style="margin-top: 50px">
					<div class="col">
						<div class="panel-heading">
							<h3 style="margin-top: 5px;">
							
								<c:choose>
									<c:when test="${edit}">
										<b>Registrar Viñas</b> 
									</c:when>
									<c:otherwise>
										Actualizar Viña
											</c:otherwise>
								</c:choose>
								
							</h3>
						</div>
						<br>
						<form:form method="POST" modelAttribute="vinias"
							class="form-horizontal">
							<form:input type="hidden" path="id" id="id" />

							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="name" style="color: black;">Nombre</label>
									<div class="col-md-7">
										<form:input type="text" path="name" id="name"
											placeholder="Nombre Viña" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="name" class="help-inline" />
										</div>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="rut" style="color: black;">Rut</label>
									<div class="col-md-7">
										<c:choose>
											<c:when test="${edit}">
												<form:input type="text" path="rut" id="rut"
													placeholder="xxxxxxxx-x" oninput="checkRut(this)" 
													class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="rut" class="help-inline" />
												</div>
											</c:when>
											<c:otherwise>
												
												<form:input type="text" path="rut" id="rut"
													placeholder="xx.xxx.xxx-x" oninput="checkRut(this)" disabled="true"
													class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="rut" class="help-inline" />
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="comuna" style="color: black;">Comuna</label>
									<div class="col-md-7">
										<form:input type="text" path="comuna" id="comuna"
											placeholder="Comuna" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="comuna" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="ciudad" style="color: black;">Ciudad</label>
									<div class="col-md-7">
										<form:input type="text" path="ciudad" id="ciudad"
											placeholder="ciudad" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="ciudad" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="direccion" style="color: black;">Direcci&oacute;n</label>
									<div class="col-md-7">
										<form:input type="text" path="direccion" id="direccion"
											placeholder="direccion viña" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="direccion" class="help-inline" />
										</div>
									</div>
								</div>
							</div>



							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="variedad" style="color: black;">Cepa</label>
									<div class="col-md-7">
										<form:select class="form-control" path="variedad" required="required" size="0">
												<form:option value="" label="Selecciona una opción" ></form:option>
												<form:option value="Cabernet sauvignon"></form:option>
												<form:option value="Chardonnay"></form:option>
												<form:option value="Sauvignon Blanc"></form:option>
												<form:option value="Merlot"></form:option>
												<form:option value="Carménére"></form:option>
												<form:option value="Syrah-Shiraz"></form:option>
												<form:option value="Pinot Noir"></form:option>
												<form:option value="Malbec"></form:option>
												
											</form:select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="descripcion" style="color: black;">descripci&oacute;n</label>
									<div class="col-md-7">
										<form:input type="text" path="descripcion" id="descripcion"
											placeholder="descripcion" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="descripcion" class="help-inline" />
										</div>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="email" style="color: black;">Email</label>
									<div class="col-md-7">
										<form:input type="text" path="email" id="email"
											placeholder="ejemplo@ejemplo.cl" pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="email" class="help-inline" />
										</div>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="longitud" style="color: black;">Longitud</label>
									<div class="col-md-7">
										<form:input type="text" path="longitud" id="coords2"
											placeholder="longitud" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="longitud" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">

									<label class="col-md-3 control-lable" for="latitud" style="color: black;">Latitud</label>
									<div class="col-md-7">
										<form:input type="text" path="latitud" id="coords"
											placeholder="latitud" required="required"
											class="form-control input-sm" />

										<div class="has-error">
											<form:errors path="latitud" class="help-inline" />
										</div>
									</div>

								</div>
							</div>
						
							<div class="row">
								<div class="form-actions floatRight">
								
							
									<c:choose>
										<c:when test="${edit}">
											<input type="submit" value="Agregar Viña"
												class="btn btn-danger" /> or <a href="vistaHome">Cancelar</a>
										</c:when>
										<c:otherwise>
											<input type="submit" value="Acualizar" class="btn btn-danger" />
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>

						</form:form>
					</div>
					
					
							
						<div id="map" class=" map col"></div>
							
					
				</div>
			</div>
		</div>
	</section>
	<br/>
		<section>
		
	<%@include file="footer.jsp"%>
</section>
	<script>

		var marker; //variable del marcador
		var coords = {}; //coordenadas obtenidas con la geolocalización
		
		//Funcion principal
		initMap = function() {

			//usamos la API para geolocalizar el usuario
			navigator.geolocation.getCurrentPosition(function(position) {
				coords = {
					lng : position.coords.longitude,
					lat : position.coords.latitude
				};
				setMapa(coords); //pasamos las coordenadas al metodo para crear el mapa

			}, function(error) {
				console.log(error);
			});

		}
		function setMapa(coords) {
			//Se crea una nueva instancia del objeto mapa
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 13,
				center : new google.maps.LatLng(coords.lat, coords.lng),

			});

			//Creamos el marcador en el mapa con sus propiedades
			//para nuestro obetivo tenemos que poner el atributo draggable en true
			//position pondremos las mismas coordenas que obtuvimos en la geolocalización
			marker = new google.maps.Marker({
				map : map,
				draggable : true,
				animation : google.maps.Animation.DROP,
				position : new google.maps.LatLng(coords.lat, coords.lng),

			});
			//agregamos un evento al marcador junto con la funcion callback al igual que el evento dragend que indica 
			//cuando el usuario a soltado el marcador
			marker.addListener('click', toggleBounce);

			marker.addListener('dragend', function(event) {
				//escribimos las coordenadas de la posicion actual del marcador dentro del input #coords
				document.getElementById("coords").value = this.getPosition()
						.lat();
				document.getElementById("coords2").value = this.getPosition()
						.lng();
			});
		}

		//callback al hacer clic en el marcador lo que hace es quitar y poner la animacion BOUNCE
		function toggleBounce() {
			if (marker.getAnimation() !== null) {
				marker.setAnimation(null);
			} else {
				marker.setAnimation(google.maps.Animation.BOUNCE);
			}
		}

		// Carga de la libreria de google maps
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAShdoO5WP63SzbJikaAk21riBk5EVWUPs&callback=initMap"></script>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
		src="${pageContext.request.contextPath}/resources/js/codigos.js"></script>
</body>
</html>