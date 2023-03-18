<%@page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder" %>
<html>

<%
String fvlLang = request.getParameter("favoriteLanguage");

//necessary when there's a while spece in the value
fvlLang = URLEncoder.encode(fvlLang, "UTF-8");

Cookie cookie = new Cookie("myApp.favoriteLanguage", fvlLang);

cookie.setMaxAge(60 * 60 * 24 * 365);
response.addCookie(cookie);

%>


<body>
	Thanks. We set your favorite language to: ${param.favoriteLanguage}
	<br><br>
	<a href="cookies-homepage.jsp">Go back to home page</a>
</body>
</html>