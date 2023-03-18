<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<html>

<body>

	<c:set var="data" value="NY, London, Paris, Bruxess"></c:set>

	<h4>Base data: ${data}</h4>
	<br>

	<h3>Split demo (string to array)</h3>
	<c:set var="citiesArray" value="${fn:split(data,',') }"></c:set>
	<c:forEach var="element" items="${citiesArray}">
		<li>${element}</li>
	</c:forEach>
	
	<br>
	<br>
	
	<h3>Join demo (array to string)</h3>
	<c:set var="joinArray" value="${fn:join(citiesArray,'-')}"></c:set>
	<b>${joinArray}</b>


</body>

</html>