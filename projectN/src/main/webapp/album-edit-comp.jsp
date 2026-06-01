<%@page import="model.entity.AlbumBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム情報編集完了画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		AlbumBean editAlbum = (AlbumBean) session.getAttribute("editAlbum");
		int cnt = (Integer)request.getAttribute("processingNumber");
	%>
	<% if(cnt == 0){ %>
	アルバム情報の変更に失敗しました<br>
	<% } else { %>
	アルバム情報を変更しました<br>
	<% } %>
	<form action="selected-album" method="post">
		<input type="submit" value="アルバム画面に戻る">
	</form>
</body>
</html>