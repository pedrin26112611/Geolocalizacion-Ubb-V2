<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>acceso denegado</title>
	
</head>
<body style="background-image: url('https://i.pinimg.com/originals/eb/ab/45/ebab45514144b2351544fdd896f9896f.jpg');">
	<div class="generic-container">
		<div class="authbar">
		<div align="center">
		<img alt=""  src="http://www.traslasierra.com/media/865615c8-845a-4ddc-9f69-5fcfbff27f13/luRAEQ/OtrasPaginas/AccesoDenegado-Grande.png" width="350" height="350">
		</div>
		<br/>
		<div align="center">
			<span ><h1 class="name-titleh1" style="color: white;font-size:40px; ">Estimado <strong style="color: red">${loggedinuser}</strong>, Usted no tiene acceso a esta pagina .</h1></span> <span class="" ><a class="btn btn-danger" href="<c:url value="/logout" />">Salir</a></span>
		</div>
		</div>
	</div>
</body>
</html>