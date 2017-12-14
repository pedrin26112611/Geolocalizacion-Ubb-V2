<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>	
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
<title>User Registration Form</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<script type="text/javascript">
	function validateMail(idMail) {
		//Creamos un objeto 
		object = document.getElementById(idMail);
		valueForm = object.value;

		// Patron para el correo
		var patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
		if (valueForm.search(patron) == 0) {
			//Mail correcto
			object.style.color = "#000";
			return;
		}
		//Mail incorrecto
		object.style.color = "#f00";
	}
</script>
<script>
	function validaSoloTexto(cadena) {
		var patron = /^[a-zA-Z]*$/;
		// En caso de querer validar cadenas con espacios usar: /^[a-zA-Z\s]*$/
		if (!cadena.search(patron))
			return true;
		else
			return false;
	}
</script>

</head>

<body style="background-image: url('https://images.alphacoders.com/168/168613.jpg');">
	<%@include file="authheader.jsp"%>
	<section>

		<div class="formulario">
			<div class="container " style="margin-left: 150px;">
				<div class="row" style="margin-top: 60px">
					<div class="col-7 banner">
						<div class="panel-heading">
							<h2 style="margin-top: 5px;font-weight: 900;color: white;">
							
									
								<c:choose>
									<c:when test="${edit}">
									<b>Actualizar Usuario</b>
										
									</c:when>
									<c:otherwise>
										Registro Usuario
											</c:otherwise>
								</c:choose>
								
							</h2>
						</div>
						<br>
						<form:form method="POST" modelAttribute="user"
							class="form-horizontal">
							<form:input type="hidden" path="id" id="id" />

							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="firstName">Nombre</label>
									<div class="col-md-7">
										<form:input type="text" path="firstName" id="firstName"
											placeholder="Nombre" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="firstName" class="help-inline" />
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="lastName">Apellido</label>
									<div class="col-md-7">
										<form:input type="text" path="lastName" id="lastName"
											placeholder="apellido" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="lastName" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="rut">Rut</label>
									<div class="col-md-7">
										<c:choose>
											<c:when test="${edit}">
												<form:input type="text" path="rut" id="rut"
													placeholder="xx.xxx.xxx-x" oninput="checkRut(this)"
													disabled="true" class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="rut" class="help-inline" />
												</div>
											</c:when>
											<c:otherwise>

												<form:input type="text" path="rut" id="rut"
													placeholder="xx.xxx.xxx-x" oninput="checkRut(this)"
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
									<label class="col-md-3 control-lable" for="telefono">Tel&eacute;fono</label>
									<div class="col-md-7">
										<form:input type="text" path="telefono" id="telefono"
											placeholder="+569xxxxxxxx" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="telefono" class="help-inline" />
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="direccion">Direcci&oacute;n</label>
									<div class="col-md-7">
										<form:input type="text" path="direccion" id="direccion"
											placeholder="Villa-poblacion-calle" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="direccion" class="help-inline" />
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="ssoId">Nombre
										de usuario</label>
									<div class="col-md-7">
										<c:choose>
											<c:when test="${edit}">
												<form:input type="text" path="ssoId" id="ssoId"
													placeholder="Juanito333" required="required"
													disabled="true" class="form-control input-sm" />
												<div class="has-error">
													<form:errors path="ssoId" class="help-inline" />
												</div>
											</c:when>
											<c:otherwise>
												<form:input type="text" path="ssoId" id="ssoId"
													placeholder="Juanito333" required="required" minlength="4"
													maxlength="8"
													pattern="[A-Za-z][A-Za-z0-9]*[0-9][A-Za-z0-9]*"
													title="el usuario debe contener de 4 a 8 caracteres y almenos un numero"
													class="form-control input-sm " />
												<div class="has-error">
													<form:errors path="ssoId" class="help-inline" />
												</div>

											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="password">Contraseña</label>
									<div class="col-md-7">
										<form:input type="password" path="password" id="password"
											placeholder="****" required="required" minlength="8"
											maxlength="16"
											pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
											title="la contraseña debe contener de 8 a 16 caracteres y almenos una mayuscula"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="password" class="help-inline" />
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-3 control-lable" for="email">Email</label>
									<div class="col-md-7">
										<form:input type="text" path="email" id='id_mail'
											placeholder="ejemplo@ejemplo.cl"
											pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"
											name="email" required="required"
											class="form-control input-sm" />
										<div class="has-error">
											<form:errors path="email" class="help-inline" />
										</div>
									</div>
								</div>
							</div>
							<!-- 
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="userProfiles">Roles</label>
								<div class="col-md-7">
									<form:select path="userProfiles" items="${roles}"
										multiple="true" itemValue="id" itemLabel="type"
										class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="userProfiles" class="help-inline" />
									</div>
								</div>
							</div>
						</div> -->

							<div class="row">
								<div class="form-actions floatRight">
								
									<c:choose>
								
										<c:when test="${edit}">
											<input type="submit" value="Acualizar"
												class="btn btn-danger" />
										</c:when>
										<c:otherwise>
											<input type="submit" value="Registrarse"
												class="btn btn-danger" />
											
											<a href="vistaHome" class="btn btn-primary ">Cancelar</a>

										</c:otherwise>
										
									</c:choose>

								</div>
							</div>
						</form:form>
					</div>
					
									
					<div class="row" align="right" style="padding-left: 30px;">
						<div class="col-3"></div>
						<img alt=""
							src="${pageContext.request.contextPath}/static/animado.gif">

					</div>
				</div>
			</div>
		</div>
	</section>
	<br/><br/><br/>
	<%@include file="footer.jsp"%>
	

	<script
		src="${pageContext.request.contextPath}/resources/js/codigos.js"></script>
	<script type="javascript"></script>
</body>
</html>