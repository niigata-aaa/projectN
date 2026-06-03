<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>管理者写真公開設定完了画面</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
		<h2>非公開にできました</h2><br>
		<div class="admin-center">
			<form action = "admin-index.jsp" >
				<input type = "submit" value = "管理者ページに戻る">
			</form>
		  
			<form action = "admin-photo-list" method="POST" class="admin-margin">
				<input type = "submit" value = "公開写真一覧に戻る">
			</form>
		</div>
</body>
</html>