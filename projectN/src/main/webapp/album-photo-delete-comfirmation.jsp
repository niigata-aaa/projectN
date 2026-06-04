<%@page import="model.entity.PhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写真削除画面</title>
<style>
.album-photo-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	height: 500px;
	overflow-y: auto;
	scroll-snap-type: y mandatory;
}

.album-photo-card {
	margin-top: 10px;
	background: rgba(255, 255, 255, 0.95);
	border: 1px solid #ccc;
	padding: 10px; border-radius : 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
	width: 300px;
	height: 380px;
	box-sizing: border-box;
	display: block;
	scroll-snap-align: start;
	border-radius: 8px;
}

.album-photo-image {
	width: 100%;
	height: 150px;
	box-sizing: border-box;
}

.album-photo-card img {
	width: 100%;
	height: 100%;
	object-fit: contain;
	border-radius: 4px;
}

.album-padding {
	padding: 10px;
}
</style
</head>
<body>
	<jsp:include page="header.jsp" />
	<h4>この写真を削除しますか？</h4>
	<div class="album-photo-list">
		<%
		PhotoBean selectPhoto = (PhotoBean) request.getAttribute("selectDeletePhoto");
		%>
<<<<<<< HEAD
		<div class="album-photo-card">
			<div class="album-photo-image">
				<img
					src="${pageContext.request.contextPath}/photo/<%=selectPhoto.getPhoto_data()%>">
			</div>
			<br>
			<h4>
				タイトル：
				<%
			if (selectPhoto.getPhoto_title() != null) {
			%>
				<%=selectPhoto.getPhoto_title()%>
				<%
				} else {
				%>
				未設定
				<%
				}
				%><br>
				<%
				if (selectPhoto.getIs_published() == 0) {
				%>
				非公開
				<%
				} else {
				%>
				公開
				<%
				}
				%>

			</h4>
			<div class="loginForm-button-design">
				<form action="album-photo-delete" method="POST">
					<input type="hidden" name="deletePhoto"
						value="<%=selectPhoto.getPhoto_id()%>"> <input
						type="submit" value="削除する">
				</form>
			</div>
			</div>
	</div>
			<div class="loginForm-button-design" style="margin-top:-70px;">
				<input type="submit"
					onclick="location.href='album-photo-delete.jsp'" value="キャンセル">
			</div>
		



=======
		<%=selectPhoto.getPhoto_title()%>
		<%
		} else {
		%>
		未設定
		<%
		}
		%><br>
		<%
		if (selectPhoto.getIs_published() == 0) {
		%>
		非公開
		<%
		} else {
		%>
		公開
		<%
		}
		%>
	  この写真を削除しますか？<br>
	  
	  <form action="album-photo-delete" method="GET">
	  	<input type="hidden" name="deletePhoto" value="<%= selectPhoto.getPhoto_id() %>">
		<input type="submit" value="キャンセル">
	  </form>
	  
	  <form action="album-photo-delete" method="POST">
	  	<input type="hidden" name="deletePhoto" value="<%= selectPhoto.getPhoto_id() %>">
		<input type="submit" value="削除する">
	  </form>
>>>>>>> refs/remotes/origin/master
</body>
</html>