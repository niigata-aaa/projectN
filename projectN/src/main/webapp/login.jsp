<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="general-user-top" name="path" />
	</jsp:include>


	<form action="login" method="POST">
		<div class="loginForm-design">
			<label class="login-id">ID</lavel> <input type="text" name="id"><br>
				<label class="login-id">パスワード</lavel> <input type="password"
					name="password"><br>
		</div>
		<div class="loginForm-button-design">
			<input type="submit" value="ログイン">

		</div>

	</form>

</body>
</html>