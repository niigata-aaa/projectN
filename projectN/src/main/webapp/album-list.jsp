
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


	<div class="flexbox">
		<div>
			<h1 class="areaName"><%=areaName%></h1>
		</div>

		<div>
			<form action="mission" method="post">
				<div class="loginForm-button-design">
					<input type="submit" value="ミッションを確認する">
				</div>
			</form>
		</div>
		<div>
			<form action="album-regi.jsp" method="post">
				<div class="loginForm-button-design">
					<input type="submit" value="アルバムを作成する">
				</div>
			</form>
		</div>
	</div>



	<h2>アルバム一覧</h2>
	<br>
<!--	<a href="selected-album" class="example"> -->
	<%
 if (albumList.size() != 0) {
 	for (AlbumBean album : albumList) {
 %> <!--	<div class="btn-square-slant" style="display:inline-block;">-->
		<form action="selected-album" method="post"
			style="display: inline-block, text-align:center;">
			<input type="hidden" name="album_id" value="<%=album.getAlbum_id()%>">
			<!--		<div class="sample_box12">-->
			<!--			<div class="sample_box12_tape"></div>-->
			<span>
				<button type="submit" class="btn btn-danger btn-sm">
					<!--				<p class="sample_box12_title">-->

					<%=album.getAlbum_name()%></p>
					<br>
					<!--				<p class="sample_box12_subtitle">-->
					期間：
					<%=album.getTrip_start()%>
					~
					<%=album.getTrip_end()%><br> 同行者：
					<%=album.getCompanion()%></p>
					<br> <br>
				</button>
			</span>
			<!--		</div>-->
		</form> <!--	</div>--> <%
 }
 } else {
 %> アルバムが作成されていません。 <%
 }
 %>
</body>
</html>