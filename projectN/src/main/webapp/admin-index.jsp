<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者トップ</title>
</head>
<style>
body{
	 background:#f5f5f5;
}
.admin-margin{
	margin-top:15px;
}
.admin-center-index{
	text-align:center;
}
.admin-center-index input[type="submit"]{
	font-size:25px;
	width:400px;
	height:200px;
	border-radius:20px;
	background:#A9A9A9;
}
</style>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="ThisIsAdminPage" name="adminPage" />
	</jsp:include>
	
	<h2>管理者ページ</h2><br>
	 <div class="admin-center-index">
	   <form action= "admin-photo-add" method = "POST" class="admin-form">
		 <input type = "submit" value = "公開写真登録" >
	   </form>
	   <form action= "admin-photo-list" method = "POST" class="admin-margin">
		 <input type = "submit" value = "公開写真一覧" >
	   </form>
	 </div><br>
	 
	 <div class="admin-center-index">
	 	<form action= "admin-regi.jsp" >
		 <input type="submit" value="管理者登録" >
	   </form>
	   
	    <form action="user-list" method = "POST" class="admin-margin">
		   <input type = "submit" value = "ユーザ一覧" class="btn-submit">
	    </form>
	 </div>
</body>
</html>