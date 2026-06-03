<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録エラー画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h2>会員登録できませんでした</h2>
	<div class="loginForm-button-design">
		<form action="user-regi.jsp" method="POST">
			<input type="submit" value="会員登録画面に戻る">
		</form>
		<!--	<a href="user-regi.jsp">-->
		<!--		<button type="submit">会員登録画面に戻る</button>-->
		<!--	</a>-->
	</div>
</body>
</html>
