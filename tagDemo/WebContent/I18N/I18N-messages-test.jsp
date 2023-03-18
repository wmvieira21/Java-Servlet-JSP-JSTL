<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="locale"
	value="${ !param.locale ? param.locale : pageContext.request.locale}"
	scope="session"></c:set>

<fmt:setLocale value="${ locale }"></fmt:setLocale>
<fmt:setBundle basename="myLabels/labels"></fmt:setBundle>

<html>
<body>

	<a href="I18N-messages-test.jsp?locale=en_US">English (US) |</a>
	<a href="I18N-messages-test.jsp?locale=pt_BR">Portuguese (BR) |</a>
	<a href="I18N-messages-test.jsp?locale=de_DE">Germany (DE)</a>
	<hr>

	<fmt:message key="label.greeting"></fmt:message>
	<br>
	<fmt:message key="label.firstName"></fmt:message>
	<br>
	<fmt:message key="label.lastName"></fmt:message>
	<br>
	<fmt:message key="label.welcome"></fmt:message>
	<hr>
	Selected locale: ${locale}
</body>
</html>