<%@page import="model.entity.AlbumBean"%>
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
	<%
		AlbumBean album = (AlbumBean)session.getAttribute("selectAlbum");
	%>
	<h2>アルバム設定</h2>
	<form action="album-edit" method="POST" class="album-regi-style">
		アルバム名 : <input type="text" name="albumName" maxlength="50" value="<%=album.getAlbum_name() %>"><br> 
		日付 : <input type="date" name="startDate" value="<%=album.getTrip_start() %>"> ～ 
			<input type="date"name="endDate" value="<%= album.getTrip_end()%>"><br> 
		同行者 : <input type="text" name="companion" maxlength="100" value="<%=album.getCompanion() %>"><br> 
		メモ : <textarea name="memo" rows="5" cols="40" maxlength="200" ><%=album.getMemo()%></textarea><br> 

		<input type="submit" value="完了" class="loginForm-button-design">
	</form>
</body>
</html>