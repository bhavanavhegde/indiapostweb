<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="css/custom.css"></script>
<link rel="stylesheet" type="text/css" href="css/custom.css" />
<title>INDIA POST</title>

<meta name="description"
	content="A javascript plugin for intelligently selecting date and time ranges inspired by Google Calendar." />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.timepicker.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/pikaday.js"></script>
<script src="js/jquery.ptTimeSelect.js"></script>
<script src="js/site.js"></script>
<script src="js/datepair.js"></script>
<script src="js/jquery.datepair.js"></script>

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
<body class="customBackground">
	<form:form method="POST" id="addScheduleForm"
		action="addpickupschedule.html">
		<p class="customSchedulePageWelcomeText">${firstname}!!!!WELCOME
			TO INDIA-POST</p>

		<p class="customText">Your are successfully registered to INDIA
			POST</p>



		<h5 align="center" class="customSchedulePageWelcomeText">SCHEDULE
			DETAILS</h5>


		<div id="indiaPost" class="custonmSchedulrDetailsInputFont">

 			<table>
 			   <tr>
 			      <td><form:label path="date">DATE:</form:label></td>
 			      <td><form:input path="date" cssClass="date" /></td>
 			   </tr>
 			    <tr>
 			      <td><form:label path="time">TIME:</form:label></td>
 			      <td><form:input path="time" cssClass="time" /></td>
 			   </tr>
 			    <tr>
 			      <td><form:label path="approximateweight">APPROXIMATE WEIGHT:</form:label></td>
 			      <td><form:input path="approximateweight" /></td>
 			   </tr>
 			   
 			</table>
			<form:hidden path="userId" />
			
			<br><br>
			
			<div id="sResponseMsg" class="customText"></div>

			<br><br>
			<button type="button" onclick="javascript:validation();">Submit</button>
			<button type="reset" value="reset">Reset</button>
		
		</div>

			<a href="login.html">Back</a>
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
			var approximateweight, date, time,userId;
			var weightPatternResult;

			date = document.getElementById("date").value;
			time = document.getElementById("time").value;
			approximateweight = document.getElementById("approximateweight").value;
			userId = document.getElementById("userId").value;

			weightPatternResult = /^[0-9]+$/.test(approximateweight);

			if (date == "") {
				alert("Date cannot be empty");
			} else if (time == "") {
				alert("Time cannot be empty");
			} else if (approximateweight == "" || !weightPatternResult) {
				alert("Invalid weight!!");
			} else {
				var json = { "date" : date, "time" : time, "approximateweight": approximateweight,"userId":userId};
		    	  
		        $.ajax({
		        	url: $("#addScheduleForm").attr( "action"),
		        	data: JSON.stringify(json),
		        	type: "POST",
		        	
		        	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("Accept", "application/json");
		        		xhr.setRequestHeader("Content-Type", "application/json");
		        		$(".error").remove();
		        	},
		        	success: function(result) {
		        		var respContent = "";
				  		respContent += "<span>Schedule was added</span>";
		        		$("#sResponseMsg").html(respContent);  
		        		$('#date').val('');
		        		$('#time').val('');
		        		$('#approximateweight').val('');
		        	},
		        	error: function(jqXHR, textStatus, errorThrown) {
		        		var respContent = "";
				  		respContent += "<span>Schedule was not added</span>";
		        		$("#sResponseMsg").html(respContent);
		        	}
		        });
			}
		}
	</script>


</body>
</html>