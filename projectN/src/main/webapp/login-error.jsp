<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインエラー</title>
</head>
<body>
<jsp:include page="header.jsp">
		<jsp:param value="album-list" name="path" />
	</jsp:include>
	<br>
	<div class="text-center" style="font-size:20px;">
	<h2>ログインできませんでした<br>
	
	</div>
	<form action="login.jsp" method="POST">
	<div  class="loginForm-button-design">
	<input type="submit" value="ログイン画面に戻る">
<!--	<a href = "login.jsp" class="loginForm-button-design" style="color: #ffffff;">ログイン画面に戻る</a>-->
	</div>
</body>
</html>