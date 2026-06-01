<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム削除確認画面</title>
</head>
<body>
<h3>アルバムを削除しますか</h3>
	<form action="album.jsp" method = "POST">
		<input type = "submit" value = "キャンセル">
	</form>
	<form action="album-delete" method = "POST">
		<input type = "submit" value = "削除する">
	</form>

</body>
</html>