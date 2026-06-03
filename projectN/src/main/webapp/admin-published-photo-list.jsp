<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真一覧画面</title>

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
	
	<h3>写真一覧</h3>
	<%
		for (PhotoBean photo : adminPhotoList){
	%>
	
	<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
	
	<div>

		<form action="AdminReleaseSettingServlet" method="POST">
			タイトル：<%=photo.getPhoto_title() %>
			<% if(photo.getIs_published() == 1) {%>
			<input type="hidden" name="photo_title" value="">
			<input type="hidden" name="is_published" value="0"> 
			<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
			<input type="submit" value="非公開にする">
			<% }%>
		</form>
	</div>
	<form action="admin-published-photo-delete.jsp" method="POST">
		<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
		<input type="submit" value="削除する">
	</form>
		
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