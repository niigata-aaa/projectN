<%@page import="model.entity.PhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>変更完了</title>
<style>
#album-photo-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	overflow-y: auto;
	scroll-snap-type: y mandatory;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="header.jsp">
			<jsp:param value="selected-album" name="path" />
		</jsp:include>
		<h2>公開設定を変更します</h2>
		<div id="album-photo-list">
			<%
		PhotoBean photo = (PhotoBean)request.getAttribute("photo");
	%>
			<div class="album-photo-card">
				<div class="album-photo-image">
					<img
						src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>">
				</div>

				<div>
					<h4>

						<% if(photo.getIs_published() == 0) {%>
						現在：非公開
						<% } else { %>
						現在：公開
						<% } %>
					</h4>
				</div>
				<div>

					<form action="release-setting-comp" method="POST">

						<!--タイトル：<input type="text" name="photo_title">-->
						<% if(photo.getIs_published() == 1) {%>
						<input type="hidden" name="is_published" value="0"> <input
							type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
						<div class="loginForm-button-design">
							<input type="submit" value="非公開にする">
							<!--						</div>-->
							<% } else { %>
							<div class="text-center">
								タイトルを入力してください：<input type="text" name="photo_title" required
									maxlength="50"><br> <input type="hidden"
									name="is_published" value="1"> <input type="hidden"
									name=name= "is_published" value="0"> <input
									type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">
								<br>
							</div>
							<div class="loginForm-button-design">
								<input type="submit" value="公開にする">
							</div>
							<% } %>
							<!--<input type="radio" name="is_published" value="0">非公開-->
							<!--<input type="radio" name="is_published" value="1">公開-->
							<!--<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">-->
							<!--<input type="submit" value="登録">-->
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="loginForm-button-design" >
			<form action="selected-album" method="POST" >
				<input type="submit" value="キャンセル">
			</form>
		</div>
</body>
</html>