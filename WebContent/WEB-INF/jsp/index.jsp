<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>REGISTRATION FORM</title>
<link rel="stylesheet" href="css/custom.css" />

</head>
<body class="customBackground">
	<form:form method="POST" action="register">

		<p class="customHeading">REGISTRATION FOR INDIA-POST SERVICE</p>
		<table>
			<tr>
				<th><form:label path="firstname">First Name</form:label></th>
				<td colspan="2"><form:input path="firstname" /></td>
			</tr>


			<tr>
				<th><form:label path="lastname">Last Name</form:label></th>
				<td><form:input path="lastname" /></td>
			</tr>


			<tr>
				<th><form:label path="email">Email</form:label></th>
				<td><form:input path="email" /></td>


			</tr>

			<tr>
				<th><form:label path="address">Address</form:label></th>
				<td><form:input path="address" /></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>

			<tr>

				<th></th>
				<td align="right">
					<button type="button" onclick="javascript:myFunction();">Submit</button>
				</td>

				<td align="right">
					<button type="reset">Reset</button>
				</td>

			</tr>

		</table>




	</form:form>

	<script type="text/javascript">
		function myFunction() {
			var firstName, lastName, address, email;

			var fNamePatResult, lNamePatResult, addPatResult, emailPatResult;
			var hasError = false;

			firstName = document.getElementById("firstname").value;
			lastName = document.getElementById("lastname").value;
			email = document.getElementById("email").value;
			address = document.getElementById("address").value;

			fNamePatResult = /^[A-Za-z\s]+$/.test(firstName);
			lNamePatResult = /^[A-Za-z\s]+$/.test(lastName);
			emailPatResult = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
					.test(email);
			addPatResult = /^[A-Za-z0-9#/\s]+$/.test(address);

			if (firstName == "" || !fNamePatResult) {
				alert("Invalid Firstname");
			} else if (lastName == "" || !lNamePatResult) {
				alert("Invalid Lastname");
			} else if (email == "" || !emailPatResult) {
				alert("Invalid email address");
			} else if (address == "" || !addPatResult) {
				alert("Invalid Address");
			} else {

				document.forms[0].submit();
			}

		}
	</script>

</body>
</html>