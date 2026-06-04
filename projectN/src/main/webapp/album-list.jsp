
<%@page import="model.entity.AlbumBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム一覧</title>
<style>
.album-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	height: 500px;
<!--	overflow: scroll;-->
	overflow-x: hidden;
	overflow-y: scroll;
	scrollbar-gutter: stable both-edges;
}

.album-card {
	margin-top: 20px;
	background: rgba(255, 255, 255, 0.95);
	border: 1px solid #ccc;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
	width: 450px;
	height: 350px;
	box-sizing: border-box;
	display: block;
}

.published-photo-card img {
	width: 100%;
	height: 250px;
	box-sizing: border-box;
	object-fit: cover;
	border-radius: 4px;
}

.published-photo-info {
	margin-top: 10px;
	font-size: 14px;
	font-weight: bold;
	color: #333;
	word-break: break-all;
	min-height: 20px;
	max-height: 40px;
	overflow: hidden;
}
</style>
</head>
<body>

	<%
	List<AlbumBean> albumList = (List<AlbumBean>) request.getAttribute("albumList");
	String areaName = (String) session.getAttribute("area_name");
	%>
	<jsp:include page="header.jsp">
		<jsp:param value="general-user-top" name="path" />
	</jsp:include>


	<div class="text-flex" style="align-items: center;">
		<div>
			<form action="mission" method="post">
				<div class="loginForm-button-design">
					<input type="submit" value="ミッションを確認する">
				</div>
			</form>
		</div>
		<div>
			<h1 class="areaName"><%=areaName%></h1>
		</div>


		<div>
			<form action="album-regi.jsp" method="post">
				<div class="loginForm-button-design">
					<input type="submit" value="アルバムを作成する">
				</div>
			</form>
		</div>

	</div>
	
	<h2 style="margin-top:0px;margin-bottom:1px;">―アルバム一覧―</h2>

	<div class="album-list">

		<%
		if (albumList.size() != 0) {
			for (AlbumBean album : albumList) {
		%>
		<form action="selected-album" method="post"
			style="display: inline-block, text-align:center;">

			<input type="hidden" name="album_id" value="<%=album.getAlbum_id()%>">

			<div class="album-card">
				<h2>
				<%=album.getAlbum_name()%></h2>
				<br> 
				<h4 style="text-align:center;">
				期間：
				<%=album.getTrip_start()%>
				~
				<%=album.getTrip_end()%>
				
				<br>
				 同行者：
				<%=album.getCompanion()%>
				</h4>
				<br> 
				<div class="loginForm-button-design">
				<input type="submit" value="アルバムを見る" class="btn btn-danger btn-sm">
				</div>
			</div>


			<!--					</button>-->
			<!--				</div>-->
			<!--			</span>-->


		</form>

		<%
		}
		%>
		<%
		} else {
		%>
		<h2>アルバムが作成されていません。</h2>
		<%
		}
		%>
	</div>
</body>
</html>