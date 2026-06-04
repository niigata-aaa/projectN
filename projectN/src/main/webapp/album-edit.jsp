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
	
	<form action="album-edit" method="POST" class="album-regi-style">
	<h2>アルバム編集</h2>
		アルバム名 : <input type="text" name="albumName" maxlength="50" value="<%=album.getAlbum_name() %>" required><br> 
		日付 : <input type="date" name="startDate" value="<%=album.getTrip_start() %>" required> ～ 
			<input type="date"name="endDate" value="<%= album.getTrip_end()%>" required><br> 
		同行者 : <input type="text" name="companion" maxlength="20" value="<%=album.getCompanion() %>"><br> 
		メモ : <textarea name="memo" rows="5" cols="40" maxlength="200" ><%=album.getMemo()%></textarea><br> 
		<div class="loginForm-button-design">
			<input type="submit" value="完了" class="loginForm-button-design" required accept="image/*">
		</div>
	</form>
</body>
</html>