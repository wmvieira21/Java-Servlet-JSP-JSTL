<html>
<body>

	<h3>Hello</h3>

	Request user agent
	<%=request.getHeader("User-Agent")%>
	<br>
	<br> 
	Request language
	<%=request.getLocale()%>

</body>
</html>