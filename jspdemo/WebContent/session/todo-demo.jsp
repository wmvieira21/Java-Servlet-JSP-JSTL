<%@  page import="java.util.*"%>
<html>
<body>
	<form action="todo-demo.jsp">
		Add new item <input type="text" name="dsItem"> <input
			type="submit" value="Submit">
	</form>
</body>

<%
List<String> itens = (List<String>) session.getAttribute("myToDoList");

if (itens == null) {
	itens = new ArrayList<String>();
	session.setAttribute("myToDoList", itens);
}

String item = request.getParameter("dsItem");
if (item != null && !item.trim().isEmpty()) {
	itens.add(item);
}
%>

<hr>
<b>To list itens</b>


<ol>
	<%
	for (String element : itens) {
		out.println("<li>" + element + "</li>");
	}
	%>
</ol>

</html>