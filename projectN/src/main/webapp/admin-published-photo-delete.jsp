<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真 削除確認画面 </title>
</head>
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

<body>
	<jsp:include page="header.jsp"/>

	
		<% request.setCharacterEncoding("UTF-8");
		   int photo_id =Integer.parseInt(request.getParameter("photo_id"));
		%>
		<h2>本当に削除しますか？</h2><br>
		<div class="admin-center">
			<form action = "admin-photo-list" method="POST">
				<input type = "submit" value = "キャンセル">
			</form>
		  
			<form action = "admin-photo-delete" method="POST" class="admin-margin">
			<input type="hidden" name="photo_id" value="<%=photo_id%>">
				<input type = "submit" value = "削除する">
			</form>
		</div>

</body>
</html>