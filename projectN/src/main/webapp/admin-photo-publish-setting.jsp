<%@page import="model.entity.PhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真一覧 公開設定確認画面</title>
</head>
<body>
<style>
body{
	 background:#f5f5f5;
}
.admin-margin{
	margin-top:15px;
}
.admin-center{
	width: 250px;   /* 必須 */
    margin: 0 auto;
}
.admin-center input[type="submit"]{
	font-size:17px;
	width:230px;
	height:40px;
	border-radius:5px;
	background:#A9A9A9;
}
</style>

	<jsp:include page="header.jsp"/>
	<%
		PhotoBean selectPhoto = (PhotoBean)request.getAttribute("selectDeletePhoto");
	%>
	
<!--	<img src="${pageContext.request.contextPath}/photo/"><br>-->
			
			<% request.setCharacterEncoding("UTF-8");
		   int photo_id =Integer.parseInt(request.getParameter("photo_id"));
		   String photo_title =request.getParameter("photo_title");
		   String is_published = request.getParameter("is_published");
			%>
			
			<h2>非公開設定にしますか？</h2><br>
			<div class="admin-center">
				<form action = "admin-photo-list" method="POST">
					<input type = "submit" value = "キャンセル">
				</form>
				
				<form action = "admin-release-setting" method="POST" class="admin-margin">
					<input type="hidden" name="photo_title" value="">
					<input type="hidden" name="is_published" value="0"> 
					<input type="hidden" name="photo_id" value="<%=photo_id%>">
						<input type = "submit" value = "非公開にする">
				</form>
			</div>
</body>
</html>
