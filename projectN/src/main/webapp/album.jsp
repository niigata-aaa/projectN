<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>
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
		AlbumBean album = (AlbumBean)session.getAttribute("selectAlbum");
		List<PhotoBean> photoList = (List<PhotoBean>)request.getAttribute("photoList");
	%>
	<jsp:include page="header.jsp">
		<jsp:param value="album-list" name="path" />
	</jsp:include>

	<a href="album-edit.jsp">アルバム設定</a><br>
	期間：<%=album.getTrip_start()%>~
	<%=album.getTrip_end()%><br> 
	タイトル:<%=album.getAlbum_name()%><br>
	同行者：<%=album.getCompanion()%><br>
	メモ：<%=album.getMemo() %><br>
	<!-- 確認はポップアップ？ -->
	
	
	<%
		if (photoList != null && !photoList.isEmpty()){
	%>
	<h3>写真一覧</h3>
	<%
		for (PhotoBean photo : photoList){
	%>
		<div>
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" ><br>
		タイトル：
		<% if(photo.getPhoto_title() != null) {%>
			<%= photo.getPhoto_title() %>
		<% } else { %>
			未設定
		<% } %><br>
		公開設定：
		<% if(photo.getIs_published() == 0) {%>
			非公開
		<% } else { %>
			公開
		<% } %>
		</div>
	<%
		}
	} else {
	%>
		<h3>写真が登録されていません</h3>
	<%
	}
	%>
	
</body>
</html>