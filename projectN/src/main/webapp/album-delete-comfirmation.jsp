<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム削除確認画面</title>
</head>
<body>
<%
int album_id = Integer.parseInt(request.getParameter("deleteAlbum_id"));
%>
<h3>アルバムを削除しますか</h3>
	<form action="selected-album" method = "POST">
		<input type = "submit" value = "キャンセル">
	</form>
	<form action="album-delete" method = "POST">
	<input type="hidden" name="album_id" value="<%= album_id %>">
		<input type = "submit" value = "削除する">
	</form>

</body>
</html>