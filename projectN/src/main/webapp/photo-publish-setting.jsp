<%@page import="model.entity.PhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>変更完了</title>
</head>
<body>
	<div>
		<jsp:include page="header.jsp">
			<jsp:param value="selected-album" name="path" />
		</jsp:include>
		<%
		PhotoBean photo = (PhotoBean)request.getAttribute("photo");
	%>
		<img
			src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>">
	</div>
	<div>

		<% if(photo.getIs_published() == 0) {%>
		現在：非公開
		<% } else { %>
		現在：公開
		<% } %>
	</div>
	<div>
		<form action="release-setting-comp" method="POST">
			<!--タイトル：<input type="text" name="photo_title">-->
			<% if(photo.getIs_published() == 1) {%>
			<input type="hidden" name="is_published" value="0"> <input
				type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
			<input type="submit" value="非公開にする">
			<% } else { %>
			タイトル：<input type="text" name="photo_title" required maxlength="50"> <input
				type="hidden" name="is_published" value="1">公開にする <input
				type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
			<input type="submit" value="公開にする">
			<% } %>
			<!--<input type="radio" name="is_published" value="0">非公開-->
			<!--<input type="radio" name="is_published" value="1">公開-->
			<!--<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">-->
			<!--<input type="submit" value="登録">-->
		</form>
	</div>
</body>
</html>