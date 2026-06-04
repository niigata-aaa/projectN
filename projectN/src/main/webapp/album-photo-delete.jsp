<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>
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
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
	width: 300px;
	height: 380px;
	box-sizing: border-box;
	display: block;
	scroll-snap-align: start;
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
</style>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="selected-album" name="path" />
	</jsp:include>
	<%
	List<PhotoBean> photoList = (List<PhotoBean>) request.getAttribute("photoList");
	// ボタンが押された（インデックスが送信されてきた）場合の処理
	String indexStr = request.getParameter("index");
	if (indexStr != null && photoList != null) {
		int index = Integer.parseInt(indexStr);
		PhotoBean selectedPhoto = photoList.get(index);

		request.setAttribute("selectDeletePhoto", selectedPhoto);
	%>
	<jsp:forward page="album-photo-delete-comfirmation.jsp" />
	<%
	return;
	}
	%>
	<h4>削除する写真を選択してください</h4>
	<div class="album-photo-list">
		<%
		if (photoList != null && !photoList.isEmpty()) {
			for (PhotoBean photo : photoList) {
		%>
		<div class="album-photo-card">
			<div class="album-photo-image">
				<img
					src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>"><br>
			</div>
			<h4>
			タイトル：
			<%
			if (photo.getPhoto_title() != null) {
			%>
			<%=photo.getPhoto_title()%>
			<%
			} else {
			%>
			未設定
			<%
			}
			%><br>
			<div class="album-padding">
				<%
				if (photo.getIs_published() == 0) {
				%>
				非公開
				<%
				} else {
				%>
				公開
				<%
				}
				%>
			</div>
			</h4>

			<!--			<input type="submit" value="削除する">-->
			<!--			<form action="album-photo-delete?index=<%=photoList.indexOf(photo)%>" method="post">-->
			<!--			<div class="loginForm-button-design">-->
			<!--				<input type="submit" value="削除する">-->
			<!--			</div>-->
			<!--			</form>-->
			<div class="loginForm-button-design">
				<a href="album-photo-delete?index=<%=photoList.indexOf(photo)%>"
					style="text-decoration: none;"><input type="submit" value="削除する"></a>
			</div>
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
</body>
</html>