<%@page import="jdbc.Student"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<title>Student Tracker</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<header>
	<div id="wrapper">
		<div id="header">
			<h2>Foobar University</h2>
		</div>
	</div>
</header>
<body>
	<div id="container">
		<div id="content">

			<input type="button" value="Add Student"
				onclick="window.location.href='add-student-form.jsp'; return false;"
				class="add-student-button">

			<form action="StudentControllerServlet" method="get">
				<input type="hidden" name="command" value="SEARCH"> 
				<input type="text" name="searchName"> 
				<input type="submit"value="Search">
			</form>
			<hr>

			<table>
				<tr></tr>
				<tr class="header-table">
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>


				<c:forEach var="listItens" items="${students_database}">

					<c:url var="tempURL" value="StudentControllerServlet">
						<c:param name="command" value="LOAD"></c:param>
						<c:param name="studentId" value="${listItens.id}"></c:param>
					</c:url>

					<c:url var="deleteURL" value="StudentControllerServlet">
						<c:param name="command" value="DELETE"></c:param>
						<c:param name="studentId" value="${listItens.id}"></c:param>
					</c:url>

					<tr>
						<th>${listItens.id}</th>
						<th>${listItens.firstName}</th>
						<th>${listItens.lastName}</th>
						<th>${listItens.email}</th>
						<th><a href="${tempURL}">Update</a> | <a href="${deleteURL}"
							onclick="if ((!confirm('Are you sure you want to delete this student?'))) return false">
								Delete</a></th>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
</body>
</html>
