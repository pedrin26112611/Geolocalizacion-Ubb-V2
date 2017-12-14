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


<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">


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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	var enero = document.getElementById("pruebaenero");
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(dibujarGrafico);
	
	function dibujarGrafico() {
		
		enero1 = eval(enero);
		// Tabla de datos: valores y etiquetas de la gráfica
		var data = google.visualization.arrayToDataTable([
				[ 'Meses', 'cantidad' ], [ 'enero', ${mesEnero} ], [ 'febrero', ${mesFebrero} ],
				[ 'marzo', ${mesMarzo} ], [ 'abril', ${mesAbril} ], [ 'mayo', ${mesMayo} ],
				[ 'junio', ${mesJunio} ], [ 'julio', ${mesJulio}], [ 'agosto', ${mesAgosto} ],
				[ 'septiembre', ${mesSeptiembre} ], [ 'octubre', ${mesOctubre} ], [ 'noviembre', ${mesNoviembre} ],
				[ 'diciembre',${mesDiciembre} ] ]);
		var options = {
			'title' : 'Productores registrados vs Mes',
			'width' : 550,
			'height' : 400
		};
		// Dibujar el gráfico
		new google.visualization.ColumnChart(
		//ColumnChart sería el tipo de gráfico a dibujar
		document.getElementById('GraficoGoogleChart-ejemplo-1')).draw(data,
				options);
	}
</script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['cepa', 'cantidad'],
          ['Cabernet sauvignon',  ${Cabernet}],
          ['Chardonnay',    ${Chardonnay}],
          ['Sauvignon Blanc',  ${SauvignonBlanc}],
          [' Merlot ',  ${Merlot}],
          ['Carménére',  ${Carmenere}],
          ['Syrah-Shiraz',  ${Syrah-Shiraz}],
          ['Pinot Noir',  ${PinotNoir}],
          ['Malbec',  ${Malbec}]
          
        ]);

        var options = {
          title: 'Ratio de cepas',
			'width' : 400,
			'height' : 300
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
</head>

<body style="background-image: url('https://images.alphacoders.com/168/168613.jpg');">
	<%@include file="authheader.jsp"%>
	<br/><br/><br/><br/><br/>
	<div class="row">
				<div class="col-md-5">

					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title" align="center" style="color: white;">Ratio de cepas</h3>

						</div>
						<div class="box-body" align="center" style="width: 600px; height: 500px">
							<!--  <div id="chart_div" align="center" ></div>-->
								<br/><br/><br/><br/>
								<div id="piechart" ></div>
						
						</div>
						<!-- /.box-body -->
					</div>

				</div>
				<!-- /.col (LEFT) -->
				<div class="col-md-7">
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title" align="center" style="margin-right: 200px;color: white;">Productores Registrados</h3>

						</div>
						<div class="box-body" style="width: 600px; height: 500px">
							<div id="GraficoGoogleChart-ejemplo-1" align="right" ></div>

						</div>
						<!-- /.box-body -->
					</div>

				</div>
				</div>
				<br/><br/><br/><br/>
				<select><%@include file="footer.jsp"%></select>
		<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="${pageContext.request.contextPath}/resources/js/resume.min.js"></script>
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