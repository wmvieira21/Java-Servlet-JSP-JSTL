<%@page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
<title>Home Page</title>
</head>
<body>

	<%
	String favLang = "Java";

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (Cookie element : cookies) {
			if (element.getName().equalsIgnoreCase("myApp.favoriteLanguage")) {
				favLang = URLDecoder.decode(element.getValue(), "UTF-8");
				break;
			}
		}
	}
	%>

<h4>New books <%= favLang %></h4>
<hr>
<a href="cookies-personalize-form.html">Personalize this page</a>
</body>
</html>