<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム削除完了画面</title>
</head>
<body>
	  <form action="album-photo-delete" method="POST">
		<h3>写真を削除しました</h3>
		<input type="submit" value="写真削除画面に戻る">
	  </form>
	  
	  <form action="selected-album" method="POST">
	    <input type="submit" value="アルバム画面に戻る">
	  </form>
</body>
</html>