<%@page import="model.entity.PhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真一覧 非公開・削除</title>
</head>
<body>

	<jsp:include page="header.jsp">
		<jsp:param value="admin-index.jsp" name="path" />
	</jsp:include>
	
	<div>
		<%
		PhotoBean photo = (PhotoBean)request.getAttribute("photo");
	%>
		<img
			src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>">

		<form action="admin-release-setting" method="POST">
		
			<% if(photo.getIs_published() == 1) {%>
			<input type="hidden" name="is_published" value="0"> <input
				type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
			<input type="submit" value="非公開にする">
			<% }%>
		</form>
	</div>
	<input type="button" onclick="location.href"
		='admin-published-photo-delete.jsp' value="削除する">
</body>
</html>
