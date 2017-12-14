<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>lista de viñas</title>

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
	href="${pageContext.request.contextPath}/resources/css/footer-distributed-with-address-and-phones.css">
</head>

<body style="background-image: url('https://images.alphacoders.com/168/168613.jpg');">

	<%@include file="authheader.jsp"%>
	
	<br/><br/>
	<div class="content-wrapper" style="padding-top: 30px;">

		<section class="container">
		
				<p><sec:authorize access="hasRole('USER')">
					<a href="<c:url value="newVinias" />" class="btn btn-danger"><span
						class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						Agregar</a>
						</sec:authorize>
				</p>
				<h2 align="center" style="color: white;"><b>Lista de viñas confirmadas</b></h2>
				<table class="table table-hover" id="myTable">
					<thead class="thead-inverse table-bordered ">
						<tr>
							<th>Nombre</th>
							<th>Rut Empresa</th>
							<th>Comuna</th>
							<th>Ciudad</th>
							<th>Descripci&oacute;n</th>
							<th>Tipo de Cepa</th>
							<th>Opci&oacute;n</th>

						</tr>
					</thead>
					<tbody class="table-bordered table-hover " style="background-color: #9a261ff2;">
						<c:forEach items="${documents}" var="doc">
							<tr>

								<td style="color: white;">${doc.name}</td>
								<td style="color: white;">${doc.rut}</td>
								<td style="color: white;">${doc.comuna}</td>
								<td style="color: white;">${doc.ciudad}</td>
								<td style="color: white;">${doc.descripcion}</td>
								<td style="color: white;">${doc.variedad}</td>
								<td>
								<sec:authorize access="hasRole('USER')">
								<a href="<c:url value='/edit-vinias-${doc.id}' />"
									class="btn btn-success custom-width">editar</a> 
									</sec:authorize>
									<sec:authorize access="hasRole('USER') or hasRole('ADMIN')">
										<a href="<c:url value='/delete-vinia-${doc.id}' />"
											class="btn btn-danger custom-width">eliminar</a>
								</sec:authorize>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
		</section>
		<sec:authorize access="hasRole('ADMIN')">
		<section class="container">
			<h2 align="center" style="color: white;"><b>Lista de viñas por confirmar</b></h2>
				<table class="table table-hover" id="tabla">
					<thead class="thead-inverse table-bordered ">
						<tr>
							<th style="background-color: #9a261ff2">Nombre</th>
							<th style="background-color: #9a261ff2">Rut Empresa</th>
							<th style="background-color: #9a261ff2">Comuna</th>
							<th style="background-color: #9a261ff2">Ciudad</th>
							<th style="background-color: #9a261ff2">Descripci&oacute;n</th>
							<th style="background-color: #9a261ff2">Tipo de Cepa</th>
							<th style="background-color: #9a261ff2">Opci&oacute;n</th>

						</tr>
					</thead>
					<tbody class="table-bordered " style="background-color: #292b2c">
						<c:forEach items="${noConfirmada}" var="noCon">
							<tr>

								<td style="color: white;">${noCon.name}</td>
								<td style="color: white;">${noCon.rut}</td>
								<td style="color: white;">${noCon.comuna}</td>
								<td style="color: white;">${noCon.ciudad}</td>
								<td style="color: white;">${noCon.descripcion}</td>
								<td style="color: white;">${noCon.variedad}</td>
								<td>
								
									<sec:authorize access="hasRole('ADMIN')">
										<a href="<c:url value='/agregar-vinia-${noCon.id}' />"
											class="btn btn-primary custom-width">Agregar</a>
											<a href="<c:url value='/visualizar-datos-vinia-${noCon.id}' />"
											class="btn btn-success custom-width">Ver</a>
											<a href="<c:url value='/delete-cooperado-admin-${noCon.id}' />"
											class="btn btn-danger custom-width">Eliminar</a>
								</sec:authorize>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
		</section>
		</sec:authorize>
	</div>
	<%@include file="footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
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
			<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/jq-3.2.1/dt-1.10.16/datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/paginacion.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/js/paginacionB.js"></script>
</body>
</html>