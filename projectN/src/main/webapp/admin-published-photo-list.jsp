<%@page import="model.entity.PhotoBean"%>


<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>管理者公開写真一覧_非公開・削除</title>

<title>管理者公開写真一覧画面</title>

</head>
<body>

	<div>
		<%
		PhotoBean photo = (PhotoBean)request.getAttribute("photo");
	%>
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
		
	</div>
	
	<div>

		<form action="admin-release-setting" method="POST">
			タイトル：<input type="text" name="photo_title">
			<% if(photo.getIs_published() == 1) {%>
			<input type="hidden" name="is_published" value="0"> <input
				type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
			<input type="submit" value="非公開にする">
			<% }%>
		</form>
	</div>
	<input type="button" onclick="location.href"
		='admin-published-photo-delete.jsp' value="削除する">
		
	<%
		List<PhotoBean> adminPhotoList = (List<PhotoBean>)request.getAttribute("adminPhotoList");
	%>
	
	<%
	if (adminPhotoList != null && !adminPhotoList.isEmpty()){
	%>
	
	<h3>写真一覧</h3>
	<%
		for (PhotoBean photo : adminPhotoList){
	%>
	
	<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
	
		
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