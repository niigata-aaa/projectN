<%@page import="model.entity.MissionPhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ミッション写真削除確認画面</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<jsp:include page="header.jsp" />

	<%
	MissionPhotoBean selectMissionPhoto = (MissionPhotoBean) request.getAttribute("missionPhoto");
	%>
	<h2>この写真をミッションから削除しますか？</h2>
	<div class="photo-card">
		<div class="photo-card-image">
			<img src="${pageContext.request.contextPath}/photo/<%=selectMissionPhoto.getMission_photo_data()%>">
		</div>
	</div>
	<form action="mission" method="POST">
		<div class="loginForm-button-design">
			<input type="submit" value="キャンセル">
		</div>
	</form>
	<form action="mission-photo-delete" method="POST">
		<input type="hidden" name="mission_photo_id"
			value="<%=selectMissionPhoto.getMission_photo_id()%>">
		<div class="loginForm-button-design">
			<input type="submit" value="削除する">
		</div>
	</form>
</body>
</html>