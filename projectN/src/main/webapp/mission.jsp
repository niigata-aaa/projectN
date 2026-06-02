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

<!--	<%-->
<!--	List<AlbumBean> albumList = (List<AlbumBean>) request.getAttribute("albumList");-->
<!--%>-->
	<%	
	String areaName = (String) session.getAttribute("area_name");
	%>

<body>
	<jsp:include page="header.jsp">
		<jsp:param value="album-list" name="path" />
	</jsp:include>
	
		<h2 style="text-align:center;"><%=areaName%></h2>
<div>
①ゆるキャラ
<form action="mission-photo-add" method="POST">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" multiple>
		<input type="hidden" id="mission_id" name="mission_id" value="1">
		<input type="submit" value="登録">
	</div>
</form>
</div

<div>
②グルメ
<form action="mission-photo-add" method="POST">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" multiple>
		<input type="hidden" id="mission_id" name="mission_id" value="2">
		<input type="submit" value="登録">
	</div>
</form>
</div>

<div>
③観光
<form action="mission-photo-add" method="POST">
	<div class="td">
		<input type="file" id="missin_photo" name="mission_photo" multiple>
		<input type="hidden" id="mission_id" name="mission_id" value="3">
		<input type="submit" value="登録">
	</div>
</form>
</div>

</body>
</html>