<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム情報編集画面</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="selected-album" name="path" />
	</jsp:include>
	<h1>アルバム設定</h1>
	<form action="album-edit" method="POST">
		アルバム名 : <input type="text" name="albumName" maxlength="50"><br> 
		日付 : <input type="date" name="startDate"> ～ 
			<input type="date"name="endDate"><br> 
		同行者 : <input type="text" name="companion" maxlength="100"><br> 
		メモ : <textarea name="memo" rows="5" cols="40" maxlength="200"></textarea><br> 
		<input type="submit" value="完了">
	</form>
</body>
</html>