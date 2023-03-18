<%@page import="com.jsp.FunUtils"%>
<html>
<body>
	<%!String makeItSlower(String data) {
		return data.toLowerCase();
	}%>

	Lower case method makeItSlower:
	<%=makeItSlower("WILLIAM")%>
	
	<br><br>
		
	Make it upper case: <%= FunUtils.makeItUpperCase("william")%> (class: FunUtils)
</body>
</html>