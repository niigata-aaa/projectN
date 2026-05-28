<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録画面</title>
</head>
<body>
	<form action="user-register" method="POST">
		ID<input type = "text" name = "user_id"><br>
		パスワード<input type = "password" name = "password"><br>
		<input type = "submit" value = "会員登録">
	</form>
</body>
</html>