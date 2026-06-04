<%@page import="model.entity.MissionPhotoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ミッション</title>
<link rel="stylesheet" href="Style.css">
<style>
#albumHeader {
	display: flex;
	min-height: 70px;
<!--	justify-content: space-between;-->
	margin-top: 10px; 
	margin-left:20px;
	margin-right:20px;
}


.albumInfoTitle {
	font-size: 20px;
	font-weight: bold;
}

.albumInfoTitle-sub {
	font-size: 16px;
	font-weight: bold;
}

#albumButton-position {
	top: 100px; /* ヘッダーの高さ分だけ下げる */
	right: 20px; /* 右端から20px */
}

#albumButton-position-left {
	top: 100px; /* ヘッダーの高さ分だけ下げる */
	left: 20px; /* 左端から20px */
	margin-right:450px;
	margin-top:18px;
}
</style>
</head>

<%
List<MissionPhotoBean> yurucharaPhotoList = (List<MissionPhotoBean>) request.getAttribute("yurucharaPhotoList");
List<MissionPhotoBean> gurmentPhotoList = (List<MissionPhotoBean>) request.getAttribute("gurmentPhotoList");
List<MissionPhotoBean> sightseePhotoList = (List<MissionPhotoBean>) request.getAttribute("sightseePhotoList");
int yurucharaCnt = (Integer) request.getAttribute("yurucharaCnt");
int gurmentCnt = (Integer) request.getAttribute("gurmentCnt");
int sightseeCnt = (Integer) request.getAttribute("sightseeCnt");
String areaName = (String) session.getAttribute("area_name");
%>



<body>
	<jsp:include page="header.jsp">
		<jsp:param value="album-list" name="path" />
	</jsp:include>

	<div id="albumHeader">
		<div id="albumButton-position-left">
			<div class="loginForm-button-design">
				<form action="album-list" method="POST">
					<input type="submit" value="アルバム一覧に戻る">
				</form>
			</div>
		</div>
		<div id="albumButton-position">
			<div>
				<h1 style="margin-top: 10px; margin-bottom: -10px;" class="areaName"><%=areaName%></h1>
			</div>
		</div>
	</div>
	<div id="all-mission-containener">
		<div class="mission-containener">
			<h2>①ゆるキャラ</h2>
			<h3>
				ミッション
				<%
			if (yurucharaCnt >= 1) {
			%>
				<span style="color: red;">達成</span>
				<%
				} else {
				%>
				<span style="color: blue;">未達成</span>
				<%
				}
				%>
			</h3>
			<form action="mission-photo-add" method="POST"
				enctype="multipart/form-data">
				<div class="td">
					<input type="file" id="missin_photo" name="mission_photo" required
						accept="image/*"> <input type="hidden" id="mission_id"
						name="mission_id" value="1">
					<div class="loginForm-button-design" style="width: 150px">
						<input type="submit" value="写真を登録">
					</div>
				</div>
			</form>
			<div class="mission-photo-list">
				<%
				for (MissionPhotoBean photo : yurucharaPhotoList) {
				%>
				<div class="missionPhoto">
					<div class="missionPhoto-image">
						<img
							src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>">
					</div>
					<form action="mission-photo-delete" method="get">
						<input type="hidden" name="mission_photo_id"
							value="<%=photo.getMission_photo_id()%>">
						<div class="loginForm-button-design"
							style="max-width: 100px; margin-top: 0; margin-bottom: 0">
							<input type="submit" value="削除する">
						</div>
					</form>
				</div>
				<%
				}
				%>
			</div>
		</div>

		<div class="mission-containener">
			<h2>②ご当地グルメ</h2>
			<h3>
				ミッション
				<%
			if (gurmentCnt >= 1) {
			%>
				<span style="color: red;">達成</span>
				<%
				} else {
				%>
				<span style="color: blue;">未達成</span>
				<%
				}
				%>
			</h3>
			<form action="mission-photo-add" method="POST"
				enctype="multipart/form-data">
				<div class="td">
					<input type="file" id="missin_photo" name="mission_photo" required
						accept="image/*"> <input type="hidden" id="mission_id"
						name="mission_id" value="2">
					<div class="loginForm-button-design" style="width: 150px">
						<input type="submit" value="写真を登録">
					</div>
				</div>
			</form>
			<div class="mission-photo-list">
				<%
				for (MissionPhotoBean photo : gurmentPhotoList) {
				%>

				<div class="missionPhoto">
					<div class="missionPhoto-image">
						<img
							src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>">
					</div>
					<form action="mission-photo-delete" method="get">
						<input type="hidden" name="mission_photo_id"
							value="<%=photo.getMission_photo_id()%>">
						<div class="loginForm-button-design"
							style="width: 100px; margin-top: 0; margin-bottom: 0">
							<input type="submit" value="削除する">
						</div>
					</form>
				</div>
				<%
				}
				%>
			</div>
		</div>

		<div class="mission-containener">
			<h2>③観光スポット</h2>
			<h3>
				ミッション
				<%
			if (sightseeCnt >= 1) {
			%>
				<span style="color: red;">達成</span>
				<%
				} else {
				%>
				<span style="color: blue;">未達成</span>
				<%
				}
				%>
			</h3>
			<form action="mission-photo-add" method="POST"
				enctype="multipart/form-data">
				<div class="td">
					<input type="file" id="missin_photo" name="mission_photo" required
						accept="image/*"> <input type="hidden" id="mission_id"
						name="mission_id" value="3">
					<div class="loginForm-button-design" style="width: 150px">
						<input type="submit" value="写真を登録">
					</div>
				</div>
			</form>
			<div class="mission-photo-list">
				<%
				for (MissionPhotoBean photo : sightseePhotoList) {
				%>
				<div class="missionPhoto">
					<div class="missionPhoto-image">
						<img
							src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>">
					</div>
					<form action="mission-photo-delete" method="get">
						<input type="hidden" name="mission_photo_id"
							value="<%=photo.getMission_photo_id()%>">
						<div class="loginForm-button-design"
							style="width: 100px; margin-top: 0; margin-bottom: 0">
							<input type="submit" value="削除する">
						</div>
					</form>
				</div>
				<%
				}
				%>
			</div>
		</div>
</body>
</html>