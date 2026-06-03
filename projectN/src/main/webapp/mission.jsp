<%@page import="model.entity.MissionPhotoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ミッション</title>
<style>
#mission-containener{
justify-content: space-evenly;
display: flex;
}

.missionPhoto{
width: 300px;              /* 正方形の幅 */
  
  background-color: #f0f0f0; /* 余白部分の背景色 */
  overflow: hidden;         /* 念のためはみ出し防止 */
display: flex;
flex-wrap:wrap;
  justify-content: center; /* 水平方向にセンターに配置 */
  align-items: center;
  aspect-ratio: 1 / 1;       /* 正方形にする（CSS3対応ブラウザ） */
}

.missionPhoto img{
width: auto;
	height: auto;
	object-fit: contain;
	display: block;
	padding:10px;
	
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
		<h1 style="text-align:center;"><%=areaName%></h1>
<div id = "mission-containener">
<div>
	<h2>①ゆるキャラ</h2>:
	<% if(yurucharaCnt >= 1){ %>ミッション達成
	<%} else{ %>ミッション未達成<%} %>
	<h3>写真一覧</h3>
<!--		<div class = "missionPhoto-img">-->
	<%
		for (MissionPhotoBean photo : yurucharaPhotoList){
	%>
		<div class = "missionPhoto">
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>" ><br>
		</div>
	<%
		}
	%>
	
	
<form action="mission-photo-add" method="POST" enctype="multipart/form-data">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" required accept="image/*">
		<input type="hidden" id="mission_id" name="mission_id" value="1">
		<input type="submit" value="登録">
	</div>
</form>
</div>

<div>
	<h2>②グルメ</h2>:
	<% if(gurmentCnt >= 1){ %>ミッション達成
	<%} else{ %>ミッション未達成<%}%>

	<h3>写真一覧</h3>
	
	<%
		for (MissionPhotoBean photo : gurmentPhotoList){
	%>
	
		<div class = "missionPhoto">
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>" ><br>
		</div>
	
	<%
		}
	%>
	
<form action="mission-photo-add" method="POST" enctype="multipart/form-data">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" required accept="image/*">
		<input type="hidden" id="mission_id" name="mission_id" value="2">
		<input type="submit" value="登録">
	</div>
</form>
</div>

<div>
	<h2>③観光</h2>:
	<% if(sightseeCnt >= 1){ %>
			ミッション達成
		<% } else { %>
		ミッション未達成
		<% } %>

	<h3>写真一覧</h3>
	
	<%
		for (MissionPhotoBean photo : sightseePhotoList){
	%>
		<div class = "missionPhoto">
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>" ><br>
		</div>
	<%
		}
	%>
<!--		</div>-->
<!--	</div>-->
	
<form action="mission-photo-add" method="POST" enctype="multipart/form-data">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" required accept="image/*">
		<input type="hidden" id="mission_id" name="mission_id" value="3">
		<input type="submit" value="登録">
	</div>
</form>
</div>
</div>


</body>
</html>