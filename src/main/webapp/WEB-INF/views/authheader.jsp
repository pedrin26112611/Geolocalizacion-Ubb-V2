
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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



</head>
<body>
	<header class="barra">
		<div class="ancho">
			<!--  <div class="logo">
				<p>
					<img alt="aaaaa" src="${pageContext.request.contextPath}/static/logo.png" width="100" height="50"/>
			</div>-->
			<nav>
				<ul>

					<li><a href="vistaHome"><i class="fa fa-home fa-2x"
							aria-hidden="true"></i> Home </a></li>



					<sec:authorize access="hasRole('USER')">
						<li><a href="listVinias"> <i
								class="fa fa-list-ul fa-2x" aria-hidden="true"></i> viñas</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ADMIN')">
						<li><a href="listViniasTotal"><i
								class="fa fa-list-ol fa-2x" aria-hidden="true"></i> viñas </a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('USER')">
				<li><a href="edit-usuario"><i
						class="fa fa-user-plus fa-2x" aria-hidden="true"></i> Actualizar perfil </a></li>
			</sec:authorize>
						<sec:authorize access="hasRole('ADMIN')">
						<li><a href="list"><i
								class="fa fa-list-ul fa-2x" aria-hidden="true"></i> usuarios </a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ADMIN')">
						<li><a href="reporte-vinias"><i
								class="fa fa-bar-chart fa-2x" aria-hidden="true"></i> estad&iacute;sticas </a></li>
					</sec:authorize>
					<c:choose>
						<c:when test="${IniClo}">
							<li><a href="login"><i
									class="fa fa-sign-in fa-2x" aria-hidden="true"></i> Iniciar Sesi&oacute;n </a></li>

						</c:when>
						<c:otherwise>
							<li><a href="login"><i
									class="fa fa-sign-out fa-2x" aria-hidden="true"></i> Cerrar Sesi&oacute;n </a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>
