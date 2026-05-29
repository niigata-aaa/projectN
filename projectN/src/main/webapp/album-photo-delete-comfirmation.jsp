<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  この写真を削除しますか？<br>
		<input type="button" onclick="location.href='album-photo-delete.jsp'" value="キャンセル">
	  
	  <form action="album-photo-delete" method="POST">
		<input type="submit" value="削除する">
	  </form>
</body>
</html>