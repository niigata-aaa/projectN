<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録完了</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	int cnt = (Integer) request.getAttribute("cnt");
	%>
	<%
	if (cnt == 1) {
	%>
	<p>
		登録完了
		<%
	}
	%>
		<a href="selected-album">modoru</a>
</body>
</html>