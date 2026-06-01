<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<linl rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="general-user-top" name="path" />
	</jsp:include>
	
	<div class="loginForm-design">
	<form action="login" method="POST">
		<label class="login-id">ID</lavel>
		<input type = "text" name = "id"><br>
		<label class="login-id">パスワード</lavel>
		<input type = "password" name = "password"><br>
		<br>
		<input type = "submit" value = "ログイン" style="margin:0 auto;">
	</form>
	</div>
</body>
</html>