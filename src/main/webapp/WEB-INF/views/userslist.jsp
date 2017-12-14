<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>	
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users List</title>

<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
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

<body style="background-image:url('https://images.alphacoders.com/168/168613.jpg'); ">

	<%@include file="authheader.jsp"%>

			<br/><br/>
		<section class="container" style="padding-top:50px;">
		
					<h2 align="center" style="color: white;"><b>Lista de usuarios confirmados</b></h2>
				<table class="table" id="myTable">
					<thead class="thead-inverse table-bordered table-hover">
						<tr>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Nombre de usuario</th>
							<th>Rut</th>
							<th>telefono</th>
							<th>Drirecci&oacute;n</th>
							<sec:authorize access="hasRole('ADMIN')">
								<th>Opcio&acute;n</th>
							</sec:authorize>

						</tr>
					</thead>
					<tbody class="table-bordered  " style="background-color: #9a261ff2;">
						<c:forEach items="${users}" var="user">
							<tr>

								<td style="color: white;">${user.firstName}</td>
								<td style="color: white;">${user.lastName}</td>
								<td style="color: white;">${user.ssoId}</td>
								<td style="color: white;">${user.rut}</td>
								<td style="color: white;">${user.telefono}</td>
								<td style="color: white;">${user.direccion}</td>
								<sec:authorize access="hasRole('ADMIN')">
									<td> <a href="<c:url value='/delete-user-${user.ssoId}' />"
										class="btn btn-danger custom-width">eliminar</a></td>
									</td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
		</section>
		<section class="container">
			<h2 align="center" style="color: white;"><b>Lista de usuarios por confirmar</b></h2>
		<table class="table" id="tabla">
					<thead class="thead-inverse table-bordered ">
						<tr>
							<th style="background-color: #9a261ff2">Nombre</th>
							<th style="background-color: #9a261ff2">Apellido</th>
							<th style="background-color: #9a261ff2">Nombre de usuario</th>
							<th style="background-color: #9a261ff2">Rut</th>
							<th style="background-color: #9a261ff2">telefono</th>
							<th style="background-color: #9a261ff2">Drirecci&oacute;n</th>
							<sec:authorize access="hasRole('ADMIN')">
								<th style="background-color: #9a261ff2">Opci&oacute;n</th>
							</sec:authorize>

						</tr>
					</thead>
					<tbody class="table-bordered table-hover " style="background-color: #292b2c">
						<c:forEach items="${userAceptar}" var="user">
							<tr>

								<td style="color: white;">${user.firstName}</td>
								<td style="color: white;">${user.lastName}</td>
								<td style="color: white;">${user.ssoId}</td>
								<td style="color: white;">${user.rut}</td>
								<td style="color: white;">${user.telefono}</td>
								<td style="color: white;">${user.direccion}</td>
								<sec:authorize access="hasRole('ADMIN')">
									<td> <a href="<c:url value='/agregar-user-${user.ssoId}' />"
										class="btn btn-success custom-width">Agregar</a>
										<a href="<c:url value='visualizar-datos-${user.id}' />"
										class="btn btn-primary custom-width">Ver</a>
										<a href="<c:url value='delete-cooperadoUser-admin-${user.ssoId}' />"
										class="btn btn-danger custom-width">Eliminar</a>
									</td>
									
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</section>
	
	<section>
	<%@include file="footer.jsp"%>
</section>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/jq-3.2.1/dt-1.10.16/datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/paginacion.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/js/paginacionB.js"></script>

</body>
</html>