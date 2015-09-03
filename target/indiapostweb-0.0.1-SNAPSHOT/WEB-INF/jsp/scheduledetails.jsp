<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset='utf-8'>

<title>schedule details</title>

<meta name="description"
	content="A javascript plugin for intelligently selecting date and time ranges inspired by Google Calendar." />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.timepicker.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/pikaday.js"></script>
<script src="js/jquery.ptTimeSelect.js"></script>
<script src="lib/moment.min.js"></script>
<script src="lib/site.js"></script>
<script src="lib/datepair.js"></script>
<script src="lib/jquery.datepair.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-datepicker.css" />
<link rel="stylesheet" type="text/css" href="css/pikaday.css" />
<link rel="stylesheet" type="text/css"
	href="css/jquery.ptTimeSelect.css" />
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css" href="css/site.css" />
</head>

<body>

	<form:form method="POST" action="confirmation">
		<h5 align="center">SCHEDULE DETAILS</h5>


		<p id="indiaPost">
			<form:label path="date">DATE:</form:label>
			<form:input path="date" cssClass="date" />



			<form:label path="time">TIME:</form:label>
			<form:input path="time" cssClass="time" />
			<form:hidden path="userId" />





			<form:label path="approximateweight">APPROXIMATE WEIGHT:</form:label>
			<form:input path="approximateweight" />




			<button type="button" onclick="javascript:validation();">Submit</button>
			<button type="reset" value="reset">Reset</button>

		</p>


	</form:form>


	<script>
		$('#indiaPost .time').timepicker({
			'showDuration' : true,
			'timeFormat' : 'g:ia'
		});

		$('#indiaPost .date').datepicker({
			'format' : 'm/d/yyyy',
			'autoclose' : true
		});
	</script>
	<script type="text/javascript">
		function validation() {
			var approximateweight, date, time;
			var weightPatternResult;

			date = document.getElementById("date").value;
			time = document.getElementById("time").value;
			approximateweight = document.getElementById("approximateweight").value;

			weightPatternResult = /^[0-9]+$/.test( approximateweight);

			 if (date == "") {
				alert("Date cannot be empty");
			} else if (time == "") {
				alert("Time cannot be empty");
			} else if ( approximateweight == "" || !weightPatternResult) {
				alert("Invalid weight!!");
			} else{
				document.forms[0].submit();
			}
		}
	</script>

</body>
</html>
