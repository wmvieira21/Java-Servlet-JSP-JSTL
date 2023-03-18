<%@page import="java.lang.reflect.Array"%>
<html>
<body>

	The student is confirmed: ${param.firstName} ${param.lastName }
	<br>
	<br> Student's country ${param.country}
	<br>
	<br> Student's programming language ${param.language }


	<br>
	<br> 
	<%
	String[] check = request.getParameterValues("languageCheck");
	
	if (check != null) {
		out.print("Checkbox Student's programming language");
		for (int i = 0; i < check.length; i++) {
			out.print("<li>" + check[i] + "</li>");
		}
	}
	%>
</body>


</html>