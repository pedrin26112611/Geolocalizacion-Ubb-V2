<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Geolocalizacion Vitivinicolas</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/estilos.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/secciones.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/barra.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer-distributed-with-address-and-phones.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/busqueda.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">

    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 60%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
       width: 100%;
        margin: 0;
        padding: 0;
      }
    </style>	
	


</head>
<body style="background-image: url('https://images.alphacoders.com/168/168613.jpg');">
	<%@include file="authheader.jsp"%>



	<section class="carusel">
		<div class="container fondo">
			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" style="position: center">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/static/Carrusell/carrusell1.jpg"
							alt="First slide" width="100" height="500">
						<c:choose>
							<c:when test="${IniClo}">
								<div class="banner-info" style="position: center">

									<h4 style="color: white">si quieres ser parte de nuestro
										sistema de geolocalizaci&oacute;n</h4>
									<a href="newuser">Registrate aqu&iacute; <i
										class="fa fa-user-plus fa-2x" aria-hidden="true"></i></a>

								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="carousel-item" style="position: center">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/static/Carrusell/carrusell2.jpg"
							alt="Second slide" width="100" height="500">
						<c:choose>
							<c:when test="${IniClo}">
								<div class="banner-info" style="position: center">

									<h4 style="color: white">si quieres ser parte de nuestro
										sistema de geolocalizaci&oacute;n</h4>

									<a href="newuser"> Registrate aqu&iacute; <i
										class="fa fa-user-plus fa-2x" aria-hidden="true"></i></a>

								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="carousel-item" style="position: center">
						<img class="d-block w-100"
							src="${pageContext.request.contextPath}/static/Carrusell/carrusell3.jpg"
							alt="Third slide" width="100" height="500">
						<c:choose>
							<c:when test="${IniClo}">
								<div class="banner-info" style="position: center">

									<h4 style="color: white">si quieres ser parte de nuestro
										sistema de geolocalizaci&oacute;n</h4>

									<a href="newuser"> Registrate aqu&iacute; <i
										class="fa fa-user-plus fa-2x" aria-hidden="true"></i></a>
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>

	<br />
	<br />
	
	<div class="row">
	<div class="col"></div>
		
		<div class=" map col-5" id="map"></div>
		<div class="col-6">
			<table class="table" id="myTable">
				<thead class="thead-inverse table-bordered ">
					<tr>
						<th>Nombre</th>
						<th>Nombre Productor</th>
						<th>Comuna</th>
						<th>Ciudad</th>
						<th>Opciones</th>

					</tr>
				</thead>
				<tbody class="table-bordered " style="background-color: #9a261ff2;">
					<c:forEach items="${list}" var="dato">
						<tr>
							<th style="color: white;"><c:out value="${dato.name}" /></th>
							<th style="color: white;"><c:out value="${dato.muestraCliente}" /></th>
							<th style="color: white;"><c:out value="${dato.comuna}" /></th>
							<th style="color: white;"><c:out value="${dato.ciudad}" /></th>
							<th style="color: white;"><a href="<c:url value='/busca-vinias-${dato.id}' />"
								class="btn btn-success custom-width">Vizualizar</a></th>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	
	<%@include file="footer.jsp"%>
<script>
				function initMap() {
					//Se le asigna la latitud y longitud inicial
					var myLatLng = {
						lat : -36.61,
						lng : -72.11
					};
					var stringContent = "Esta es una oración de relleno, por favor, cierrela ;)";

					//Inicializa el mapa
					var map = new google.maps.Map(
							document.getElementById("map"),
							{
								zoom : 10,
								center : myLatLng,
								zoomControl : true,
								scaleControl : true,
								mapTypeControl : true,
								mapTypeControlOptions : {
									style : google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
									position : google.maps.ControlPosition.TOP_LEFT,
									mapTypeIds : [ "roadmap", "terrain",
											"satellite", "hybrid" ]
								}
							});
					myLatLng = [{lat: -36.590989571558445, lng: -72.0186852895996}, {lat: -36.517226574606845, lng: -72.15291731274414}, {lat: -36.60944173014805, lng: -72.2263306557129}]
					//Carga los marcadores desde la base de datos (Aún no implementada la base de datos)
					for (var i = 0; i < 3; i++) {
						
						//stringContent = consultar

						//Añade un marcador al mapa con la ubicación de una viña
						var marker = new google.maps.Marker({
							position : myLatLng[i],
							map : map,
							title : "",
							animation : google.maps.Animation.DROP
						});

						//Añade la información de la viña al marcador
						var infoWindow = new google.maps.InfoWindow({
							content : stringContent,
							maxWidth : 200
						});

						//Añade un recuadro con información al marcador
						marker.addListener('click', function() {
							infoWindow.open(map, marker);
						});
					}
				}
			</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAShdoO5WP63SzbJikaAk21riBk5EVWUPs&callback=initMap"></script>



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
		
		
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
		
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>
	
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/jq-3.2.1/dt-1.10.16/datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/paginacion.js"></script>
</body>
</html>