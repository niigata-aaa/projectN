<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム情報編集画面</title>
</head>
<body>
<h1>アルバム設定</h1>
<form action="album-edit-confirmation.jsp" method="GET">
アルバム名　<input type="text" name="albumName"><br>
日付　<input type="date" name="startDate">～<input type="date" name="endDate"><br>
同行者　<input type="text" name="companion"><br>
メモ　<input type="textarea" name="memo"><br>
<br>
<input type="submit" value="完了">
</form>
</body>
</html>