<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	    .admin-margin{
			margin-top:15px;
		}
		.admin-center{
			width: 250px;   /* 必須 */
    		margin: 0 auto;
		}
	
	
	
	
	</style>
<meta charset="UTF-8">
<title>管理者公開写真登録完了画面</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<jsp:include page="header.jsp">


<% int cnt = (Integer)request.getAttribute("cnt"); 
	if (cnt == 1) {
%>
<h2>登録できました</h2>
<% }else{ %>
<h2>登録できませんでした</h2>
<% }%>
	   
		 <form action = "admin-index.jsp" class=admin-center>
			<input type = "submit" value = "管理者ページに戻る">
		 </form>
		  
		 <form action = "admin-photo-add" method="POST" class=admin-center>
			<input type = "submit" value = "写真登録画面に戻る" class="admin-margin">
		 </form>
	  
	

</body>
</html>