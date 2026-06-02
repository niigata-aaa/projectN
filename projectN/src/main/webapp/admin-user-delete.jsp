<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認画面</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = request.getParameter("user_id");
%>
<%=user_id %>　さんを削除しますか
	<form action="user-list" method = "POST">
		<input type = "submit" value = "キャンセル">
	</form>
	<form action="user-delete" method = "GET">
		<input type = "hidden" name = "user_id" value = "<%=user_id%>">
		<input type = "submit" value = "削除する">
	</form>

</body>
</html>