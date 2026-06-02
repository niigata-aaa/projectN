<%@page import="model.entity.MissionPhotoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ミッション</title>
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
	
		<h2 style="text-align:center;"><%=areaName%></h2>
<div>
①ゆるキャラ:<% if(yurucharaCnt > 1){ %>ミッション達成
<%} else{ %>ミッション未達成<%} %>
<h3>写真一覧</h3>
	<%
		for (MissionPhotoBean photo : yurucharaPhotoList){
	%>
		<div>
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>" ><br>
		</div>
	<%
		}
	%>
<form action="mission-photo-add" method="POST" enctype="multipart/form-data">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" multiple>
		<input type="hidden" id="mission_id" name="mission_id" value="1">
		<input type="submit" value="登録">
	</div>
</form>
</div

<div>
②グルメ:<% if(gurmentCnt > 1){ %>ミッション達成
<%} else{ %>ミッション未達成<%}%>

<h3>写真一覧</h3>
	<%
		for (MissionPhotoBean photo : gurmentPhotoList){
	%>
		<div>
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>" ><br>
		</div>
	<%
		}
	%>
	
<form action="mission-photo-add" method="POST" enctype="multipart/form-data">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" multiple>
		<input type="hidden" id="mission_id" name="mission_id" value="2">
		<input type="submit" value="登録">
	</div>
</form>
</div>

<div>
③観光:<% if(sightseeCnt > 1){ %>
			ミッション達成
		<% } else { %>
		ミッション未達成
		<% } %>

<h3>写真一覧</h3>
	<%
		for (MissionPhotoBean photo : sightseePhotoList){
	%>
		<div>
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getMission_photo_data()%>" ><br>
		</div>
	<%
		}
	%>
	
<form action="mission-photo-add" method="POST" enctype="multipart/form-data">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" multiple>
		<input type="hidden" id="mission_id" name="mission_id" value="3">
		<input type="submit" value="登録">
	</div>
</form>
</div>

</body>
</html>