<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String[] cities = { "New York", "London", "Bruxess" };

pageContext.setAttribute("listCities", cities);
%>

<html>

<body>

	<c:forEach var="elements" items="${ listCities}">
		${elements} <br>
	</c:forEach>

</body>

</html>