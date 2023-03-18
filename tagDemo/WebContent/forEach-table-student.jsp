<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="student.StudentModel"%>
<%@page import="java.util.List"%>

<%
List<StudentModel> students = new ArrayList<StudentModel>();

students.add(new StudentModel("Willliam", "Vieira", true));
students.add(new StudentModel("Adriana", "Brunner", true));
students.add(new StudentModel("Loony", "Vieira", false));
students.add(new StudentModel("PP", "Vieira", false));

pageContext.setAttribute("students", students);

Cookie studentCookie = new Cookie("studentsCookie", students.get(0).getFirstName());
studentCookie.setMaxAge(60 * 60 * 24 * 2);
response.addCookie(studentCookie);
%>

<html>

<body>

	Table with forEach and if
	<table border="1">

		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gold Customer</th>
		</tr>
		<c:forEach var="student" items="${students}">
			<tr>
				<th>${student.firstName}</th>
				<th>${student.lastName}</th>
				<th>
				<c:if test="${student.goldCustomer}">Special Discount</c:if>
				<c:if test="${!student.goldCustomer}">Normal price</c:if>
				</th>
			</tr>
		</c:forEach>

	</table>

	<br>
	<br> Table with forEach and choose
	<table border="1">

		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gold Customer</th>
		</tr>
		<c:forEach var="student" items="${students}">
			<tr>
				<th>${student.firstName}</th>
				<th>${student.lastName}</th>
				<th>
				<c:choose>
					<c:when test="${student.goldCustomer}">Discount</c:when>
					<c:otherwise>Normal</c:otherwise>
				</c:choose>
				</th>
			</tr>
		</c:forEach>

	</table>
	<br>
	<br>
	Catch cookie: ${cookie.studentsCookie.value}

	<h3>ForEach cookies</h3>

	<c:forEach var="currentCookie" items="${cookie}">	
		Key=${currentCookie.key} Value=${currentCookie.value.value} <br>
	</c:forEach>


</body>

</html>