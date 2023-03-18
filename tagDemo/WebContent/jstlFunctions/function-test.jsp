<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>;
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>

<body>

	<c:set var="data" value="william martins vieira"></c:set>

	length of the string<b>${data }</b>: ${fn:length(data)}

	<br><br>
	UpperCase version of the string <b>${data }</b>: ${fn:toUpperCase(data)}


	<br><br>
	Does the string <b>${data }</b> starts with 'will': ${fn:startsWith(data, "will")}
	<br>
	Does the string <b>${data }</b> starts with 'vieira': ${fn:startsWith(data, "vieira")}

</body>

</html>