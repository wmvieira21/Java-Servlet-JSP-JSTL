<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html>
<body>
	<h3>Hello world of Java</h3>
	The time on the server is
	<%=new SimpleDateFormat("dd/MM/yyyy hh:mm:ss").format(new Date())%>
</body>
</html>