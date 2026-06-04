<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録画面</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="main-top" name="path" />
	</jsp:include>
	<h2>会員登録</h2>
	<form action="user-register" method="POST">
		<div class="loginForm-design">
			<label class="login-id">ID<span style="color: red;">*</span></label><input type = "text" name = "user_id" required maxlength="100"><br>
			<label class="login-id">パスワード<span style="color: red;">*</span></label><input type = "password" name = "password" required minlength="8" maxlength="100"><br>
		</div>
		<div class="loginForm-button-design">
			<input type = "submit" value = "会員登録">
		</div>
	</form>
</body>
</html>