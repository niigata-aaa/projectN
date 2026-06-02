<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.AlbumBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム画面</title>
<style>
#albumHeader {
	display: flex;
}
#albumButton{
background: #6bb6ff;
	border-radius: 3px;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
	max-width: 240px;

	color: #003067;
	transition: 0.3s ease-in-out;
	font-weight: 900;
	border: 2px solid #000;
	z-index: 1;
	border-radius: 5px;
	margin-top:2%;
	margin-bottom: 2%;
}

</style>
</head>
<body>
	<div class = "text-center">	
		<%
			AlbumBean album = (AlbumBean)session.getAttribute("selectAlbum");
			List<PhotoBean> photoList = (List<PhotoBean>)request.getAttribute("photoList");
		%>
		<jsp:include page="header.jsp">
			<jsp:param value="album-list" name="path" />
		</jsp:include>
		
		<div id = "albumHeader">
		<div>
		<a href="album-edit.jsp">アルバム設定</a><br>
		</div>
		<div>
		期間：<%=album.getTrip_start()%>~
		<%=album.getTrip_end()%><br> 
		タイトル:<%=album.getAlbum_name()%><br>
		同行者：<%=album.getCompanion()%><br>
		メモ：<%=album.getMemo() %><br>
		</div>
			<form action="album-delete-comfirmation.jsp" method="POST">
			<input type="hidden" name="deleteAlbum_id" value="<%= album.getAlbum_id()%>">
			<input type="hidden" name="deleteAlbum_name" value="<%= album.getAlbum_name()%>">
			<div id = albumButton>
				<input type="submit" value="アルバム削除">
			</div>	
				</form>
				<form action="album-photo-add.jsp" method = "POST">
					<div id = albumButton>
						<input type = "submit" value = "写真追加">
					</div>
				</form>
				<form action="album-photo-delete" method = "POST">
			<div id = albumButton>
				<input type="submit" value="写真削除">
			</div>
		</form>
		</div>
		<%
			if (photoList != null && !photoList.isEmpty()){
		%>
		<div class = "text-flex">
		<h3 class = "user-index-left-container">写真一覧</h3>
		<%
			for (PhotoBean photo : photoList){
		%>
			<div>
			<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" ><br>
			タイトル：
			<% if(photo.getPhoto_title() != null) {%>
				<%= photo.getPhoto_title() %>
			<% } else { %>
				未設定
			<% } %><br>
			<form action="release-setting" method="POST">
			<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
<!--			<div style = ""class="loginForm-button-design">-->
				<input type="submit" value="公開設定">
<!--			</div>-->
			</form>
			<% if(photo.getIs_published() == 0) {%>
				非公開
			<% } else { %>
				公開
			<% } %>
			</div>
		<%
			}
		} else {
		%>
			<h3>写真が登録されていません</h3>
		<%
		}
		%>
		</div>
	</div>
	
</body>
</html>