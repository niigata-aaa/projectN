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
<h1>アルバム『<%=album_name %>』を削除しました</h1>
<form action="album-list" method="get">
<input type="submit" value="アルバム画面に戻る">
</form>

</body>
</html>