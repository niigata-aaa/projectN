<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>にいカイブ｜トップ画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<form action="release-photo-list" method="POST">
		<div class="loginForm-button-design">
			<input type="submit" value="公開写真一覧" style="margin: 0 auto;">
		</div>
	</form>
</body>
</html>