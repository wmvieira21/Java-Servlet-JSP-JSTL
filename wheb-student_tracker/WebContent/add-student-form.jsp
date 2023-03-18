<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">
<link type="text/css" rel="stylesheet" href="css/add-student-style.css">
<script type="text/javascript" src="js/student-validation-form.js"></script>
<title>Add new Student</title>
</head>
<header>
	<div id="header">
		<h2>Foobar University</h2>
	</div>
</header>

<body>
	<div id="container">
		<h3>Add Student</h3>
	</div>


	<form action="StudentControllerServlet" method="post" name="studentForm" onsubmit="return validateForm()">
		
		<input type="hidden" name="command" value="ADD">

		<table>
			<tbody>
				<tr>
					<th><label>First Name:</label></th>
					<th><input type="text" name="firstName"></th>
				</tr>
				<tr>
					<th><label>Last Name:</label></th>
					<th><input type="text" name="lastName"></th>
				</tr>
				<tr>
					<th><label>Email:</label></th>
					<th><input type="text" name="email"></th>
				</tr>
				<tr>
					<th><label></label></th>
					<th><input type="submit" value="Save" id="save"></th>
				</tr>
			</tbody>
		</table>
	</form>

	<div>
		<a href="StudentControllerServlet">Back to list</a>
	</div>


</body>
</html>