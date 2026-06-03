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
	min-height:200px;
}

#albumInfo{
width:70%;
padding:10px;
font-size:20px;
line-height:2;
background:white;
border-radius:10px;
box-shadow:0 2px 10px rgba(0,0,0,0.15);
overflow-wrap: break-word;
}

.albumInfoTitle{
font-size:24px;
font-weight:bold;
}

#albumButton-position{
position: absolute; /* ページ内で絶対位置指定 */
  top: 130px;          /* ヘッダーの高さ分だけ下げる */
  right: 20px; /* 右端から20px */
  }
  
#albumPhoto{
display: flex;
justify-content:center;
flex-wrap:wrap;
gap:30px;
margin-left:50px;
}
</style>
</head>
<body>
		<%
			AlbumBean album = (AlbumBean)session.getAttribute("selectAlbum");
			List<PhotoBean> photoList = (List<PhotoBean>)request.getAttribute("photoList");
		%>
		<jsp:include page="header.jsp">
			<jsp:param value="album-list" name="path" />
		</jsp:include>
		
		<div id = "albumHeader">
			<div id="albumInfo">
				<span class = "albumInfoTitle">タイトル</span>:<%=album.getAlbum_name()%><br>
				<span class = "albumInfoTitle">期間</span>：<%=album.getTrip_start()%>~
				<%=album.getTrip_end()%><br> 
				<span class = "albumInfoTitle">同行者</span>：<%=album.getCompanion()%><br>
				<span class = "albumInfoTitle">メモ</span>：<%=album.getMemo() %><br>
			</div>
			<div id = "albumButton-position">
				<form action="album-edit.jsp" method = "POST">
					<div class = loginForm-button-design>
						<input type = "submit" value = "アルバム設定">
					</div>
				</form>
				<form action="album-delete-comfirmation.jsp" method="POST">
					<input type="hidden" name="deleteAlbum_id" value="<%= album.getAlbum_id()%>">
					<input type="hidden" name="deleteAlbum_name" value="<%= album.getAlbum_name()%>">
					<div class = loginForm-button-design>
						<input type="submit" value="アルバム削除">
					</div>	
				</form>
				<form action="album-photo-add.jsp" method = "POST">
					<div class = "loginForm-button-design">
						<input type = "submit" value = "写真追加">
					</div>
				</form>
				<form action="album-photo-delete" method = "GET">
					<div class = "loginForm-button-design">
						<input type="submit" value="写真削除">
					</div>
				</form>
			</div>
		</div>
	
	
		<% 
		String ErrorMessage = null;
	 	ErrorMessage = (String)request.getAttribute("ErrorMessage"); 
		%>
		
		<%
			if (photoList != null && !photoList.isEmpty()){
		%>
		<h2>＜写真一覧＞</h2>
		<div id = "albumPhoto">
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
	
</body>
</html>