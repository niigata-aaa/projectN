<%@page import="model.entity.AlbumBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム画面</title>
</head>
<body>
	<%
	AlbumBean album = (AlbumBean) session.getAttribute("selectAlbum");
	%>
	<jsp:include page="header.jsp">
		<jsp:param value="album-list" name="path" />
	</jsp:include>

	<a href="photo-publish-setting.jsp">アルバム設定</a><br>
	期間：<%=album.getTrip_start()%>~
	<%=album.getTrip_end()%><br> 
	タイトル:<%=album.getAlbum_name()%><br>
	同行者：<%=album.getCompanion()%><br>
	メモ：<%=album.getMemo() %><br>
	<!-- 確認はポップアップ？ -->
	<a href="album-delete-comfirmation">アルバム削除</a>
	<a href="album-photo-add">写真追加</a>
	<a href="album-photo-delete">写真削除</a>
	
	
</body>
</html>