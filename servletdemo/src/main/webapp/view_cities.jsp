<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<body>

	<c:forEach var="tempCities" items="${cities_list}">
		${tempCities} <br>
	</c:forEach>

</body>
</html>