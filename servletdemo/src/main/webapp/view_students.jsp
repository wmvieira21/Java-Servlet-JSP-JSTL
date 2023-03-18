<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students</title>
</head>
<body>

	<table border="1">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email Address</th>
		</tr>

		<c:forEach var="studentsData" items="${students_list}">
			<tr>
				<th>${studentsData.firstName}</th>
				<th>${studentsData.lastName}</th>
				<th>${studentsData.email}</th>
			</tr>
		</c:forEach>
	</table>

</body>
</html>