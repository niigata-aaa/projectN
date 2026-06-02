<%@page import="model.entity.PhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写真削除画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		PhotoBean selectPhoto = (PhotoBean)request.getAttribute("selectDeletePhoto");
	%>
	<img
			src="${pageContext.request.contextPath}/photo/<%=selectPhoto.getPhoto_data()%>"><br>
		タイトル：
		<%
		if (selectPhoto.getPhoto_title() != null) {
		%>
		<%=selectPhoto.getPhoto_title()%>
		<%
		} else {
		%>
		未設定
		<%
		}
		%><br>
		<%
		if (selectPhoto.getIs_published() == 0) {
		%>
		非公開
		<%
		} else {
		%>
		公開
		<%
		}
		%>
	  この写真を削除しますか？<br>
	  
	  <input type="button" onclick="location.href='album-photo-delete.jsp'" value="キャンセル">
	  
	  <form action="album-photo-delete" method="POST">
	  	<input type="hidden" name="deletePhoto" value="<%= selectPhoto.getPhoto_id() %>">
		<input type="submit" value="削除する">
	  </form>
</body>
</html>