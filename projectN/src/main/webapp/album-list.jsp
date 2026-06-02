
<%@page import="model.entity.AlbumBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム一覧</title>
</head>
<body>
	<%
	List<AlbumBean> albumList = (List<AlbumBean>) request.getAttribute("albumList");
	String areaName = (String) session.getAttribute("area_name");
	%>
	<jsp:include page="header.jsp">
		<jsp:param value="general-user-top" name="path" />
	</jsp:include>

	<h2 style="text-align: center;" class="areaName"><%=areaName%></h2>
	<form action="mission" method="post">
		<div class="loginForm-button-design">
			<input type="submit" value="ミッションを確認する">
		</div>
	</form>

	<form action="album-regi.jsp" method="post">
		<div class="loginForm-button-design">
			<input type="submit" value="アルバムを作成する">
		</div>
	</form>
	<%
	if (albumList.size() != 0) {
		for (AlbumBean album : albumList) {
	%>
	
	<div class="album-select-design">
	<form action="selected-album" method="post">
		<input type="hidden" name="album_id" value="<%=album.getAlbum_id()%>">
		<button type="submit" class="btn btn-danger btn-sm">
			<p1>タイトル:
			<%=album.getAlbum_name()%></p1><br> 期間：
			<%=album.getTrip_start()%>
			~
			<%=album.getTrip_end()%><br> 同行者：
			<%=album.getCompanion()%><br>
		</button>
	</form>
	</div>
	<%
	}
	} else {
	%>
	アルバムが作成されていません。
	<%
	}
	%>
</body>
</html>