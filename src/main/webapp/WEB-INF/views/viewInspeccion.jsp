<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
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
	href="${pageContext.request.contextPath}/resources/css/slider.css">

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

<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>


</head>
<body
	style="background-image: url('https://images.alphacoders.com/168/168613.jpg');">
	<%@include file="authheader.jsp"%>

	<br />
	<br />
	<br />
	<br />


	<section class="wap">
		<br> <br>
		<h2 align="center" style="color: white;">
			<b>Evaluar viña ''${vinia.name}'' </b>
		</h2>
		<div class="row">

			<div class="col" style="margin-top: 40px;">
				<table class="table  table-bordered">
					<thead>

					</thead>
					<tbody class="table-bordered  "
						style="background-color: #9a261ff2;">
						<tr>
							<th colspan="6" style="color: white;">Nombre</th>
							<th colspan="6" style="color: white;">${vinia.name}</th>
						</tr>
						<tr>
							<th colspan="6" style="color: white;">Comuna</th>
							<th colspan="6" style="color: white;">${vinia.comuna}</th>
						</tr>
						<tr>
							<th colspan="6" style="color: white;">Ciudad</th>
							<th colspan="6" style="color: white;">${vinia.ciudad}</th>
						</tr>
						<tr>
							<th colspan="6" style="color: white;">Direcci&oacute;n</th>
							<th colspan="6" style="color: white;">${vinia.direccion}</th>
						</tr>
						<tr>
							<th colspan="6" style="color: white;">Variedad</th>
							<th colspan="6" style="color: white;">${vinia.variedad}</th>
						</tr>
						<tr>
							<th colspan="6" style="color: white;">Descripci&oacute;n:</th>
							<th colspan="6" style="color: white;">${vinia.descripcion}</th>

						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</section>
	<div align="center">
		<a href="<c:url value='/listViniasTotal' />"
			class="btn btn-primary custom-width">Volver</a>
	</div>
	<br/><br/>
	<section>
	<%@include file="footer.jsp"%>
	</section>






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
</body>
</html>