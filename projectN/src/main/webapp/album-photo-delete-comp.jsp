<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム削除完了画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h4>写真を削除しました</h4>
	<div class="loginForm-button-design">
		<form action="album-photo-delete" method="get">
			<input type="submit" value="写真削除画面に戻る">
		</form>
	</div>
	<div class="loginForm-button-design">
		<form action="selected-album" method="POST">
			<input type="submit" value="アルバム画面に戻る">
		</form>
	</div>
</body>
</html>