<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者トップ</title>
</head>
	<style>
		
	
	
	
	
	
	
	</style>
<body>
	<h2>管理者ページ</h2><br>
	<form action= "admin-photo-add" method = "POST">
		<input type = "submit" value = "公開写真登録">
	</form>
	<form action= "admin-photo-list" method = "POST">
		<input type = "submit" value = "公開写真一覧">
	</form>
	<a href = "admin-regi.jsp">管理者登録</a>
	<form action="user-list" method = "POST">
		<input type = "submit" value = "ユーザ一覧">
	</form>
</body>
</html>