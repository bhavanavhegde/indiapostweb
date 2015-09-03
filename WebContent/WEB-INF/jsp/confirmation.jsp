<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CONFIRMATION PAGE</title>
<script src="css/custom.css"></script>
<link rel="stylesheet" type="text/css" href="css/custom.css" />
</head>
<body class="customBackground">
	<p class="customHeading">CONFIRMATION!!!</p>

	<p class="customText">Thank you for using POST-INDIA Service your
		schedule have been confirmed on date:${date} time:${time}.
	<p>
		<a href="setschedule.html?userId=${userId}&firstname=${firstname}">BACK</a>
	</p>
</body>
</html>