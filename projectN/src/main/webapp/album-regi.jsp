<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規アルバム登録画面</title>
</head>
<body>
<h1>新規アルバム作成</h1>
<form action="album-register" method="POST">
アルバム名<input type="text" name="albumName"><br>
日付<input type="date" name="startDate">～<input type="date" name="endDate"><br>
同行者<input type="text" name="companion"><br>
メモ<input type="textarea" name="memo"><br>
写真登録<input type="file" name="photoRegistration"> <br>
<br>
<input type="submit" value="作成">
</form>

</body>
</html>