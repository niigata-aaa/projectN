<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム削除完了画面</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String album_name = request.getParameter("album_name");
%>
<jsp:include page="header.jsp">
		<jsp:param value="general-user-top" name="path" />
</jsp:include>
	
<h2>アルバム『<%=album_name %>』を削除しました</h2>
<form action="album-list" method="get">
<div class = "loginForm-button-design">
	<input type="submit" value="アルバム画面に戻る">
</div>
</form>

</body>
</html>