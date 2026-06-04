<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真一覧画面</title>
<style>
body{
	 background:#f5f5f5;
}
.admin-button input[type="submit"]{
			font-size:17px;
			width:150px;
			height:40px;
		 	border-radius:5px;
		 	background:#A9A9A9;
		 	margin-bottom:5px;
		 	margin-top:5px;
}

.admin-published-photo-list {
	display: flex;
	flex-wrap:wrap;
	justify-content:space-around;
	height: 70vh;
	overflow: scroll;
	overflow-x:hidden;
}

.admin-published-photo-card {
	margin-top: 20px;
	background: rgba(255, 255, 255, 0.95);
	border: 1px solid #ccc;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
	width: 450px;           
	height: 420px;
	box-sizing: border-box;
	display: block;
	
}

.admin-published-photo-image{
	width: 100%;
	height: 275px;
	box-sizing: border-box;
	
}

.admin-published-photo-card img {
	width: 100%;
	height: 100%;
	object-fit: contain;
	border-radius: 4px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="admin-index.jsp" name="path" />
	</jsp:include>
	<%
		List<PhotoBean> adminPhotoList = (List<PhotoBean>)request.getAttribute("photoList");
	%>
	
	<%
	if (adminPhotoList != null && !adminPhotoList.isEmpty()){
	%>
	
	<h2>公開写真一覧</h2>
	<div class ="admin-published-photo-list">
	<%
		for (PhotoBean photo : adminPhotoList){
	%>
	<div class="admin-published-photo-card">
		<div class="admin-published-photo-image">
			<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
		</div>
	
	<div>

		<form action="admin-photo-publish-setting.jsp" method="POST">
			タイトル：<%=photo.getPhoto_title() %>
			<% if(photo.getIs_published() == 1) {%>
			<input type="hidden" name="photo_title" value="">
			<input type="hidden" name="is_published" value="0"> 
			<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
			<div class = "admin-button">
			  <input type="submit" value="非公開にする">
			</div>
			<% }%>
		</form>
	</div>
	<form action="admin-published-photo-delete.jsp" method="POST">
		<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
		<div class = "admin-button">
		<input type="submit" value="削除する">
		</div>
	</form>
	</div>	
	<%
		}
	
	} else {
	%>
		<h4>写真が登録されていません</h4>
	<%
	}
	%>
	</div>
</body>
</html>