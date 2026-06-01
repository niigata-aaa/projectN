<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写真削除画面</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="selected-album" name="path" />
	</jsp:include>
	<%
	List<PhotoBean> photoList = (List<PhotoBean>) request.getAttribute("photoList");
	// ボタンが押された（インデックスが送信されてきた）場合の処理
	String indexStr = request.getParameter("index");
	if (indexStr != null) {
		int index = Integer.parseInt(indexStr);
		PhotoBean selectedPhoto = photoList.get(index);

		request.setAttribute("selectDeletePhoto", selectedPhoto);
	%>
	<jsp:forward page="album-photo-delete-comfirmation.jsp" />
	<%
		}
	%>
	<h3>写真削除</h3>
	<%
	if (photoList != null && !photoList.isEmpty()) {
		for (PhotoBean photo : photoList) {
	%>
	<div>
		<img
			src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>"><br>
		タイトル：
		<%
		if (photo.getPhoto_title() != null) {
		%>
		<%=photo.getPhoto_title()%>
		<%
		} else {
		%>
		未設定
		<%
		}
		%><br>
		<%
		if (photo.getIs_published() == 0) {
		%>
		非公開
		<%
		} else {
		%>
		公開
		<%
		}
		%>
		<a href="album-photo-delete.jsp?index=<%= photoList.indexOf(photo) %>">削除する</a>
	</div>
	<%
	}
	} else {
	%>
	<h3>写真が登録されていません</h3>
	<%
	}
	%>
	<input type="button"
		onclick="location.href='album-photo-delete-comfirmation.jsp'"
		value="削除する">
</body>
</html>