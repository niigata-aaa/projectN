<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録完了画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class = "text-center">
	<h2>会員登録できました</h2>
		<form action="login.jsp">
		<div class = loginForm-button-design>
			<input type = "submit" value = "ログイン画面に進む">
		</div>
		</form>
	</div>
</body>
</html>