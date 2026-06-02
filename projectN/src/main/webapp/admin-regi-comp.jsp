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
<title>管理者登録完了画面</title>
</head>
<body>v
	<jsp:include page="header.jsp">
		<jsp:param value="selected-album" name="path" />
	</jsp:include>
	
	<h2>管理者登録が完了しました</h2><br>
	<div class=admin-center>
	  <form action = "admin-index.jsp">
			<input type = "submit" value = "管理者ページに戻る">
	  </form>
	
	  <form action = "admin-regi.jsp" class="admin-margin">
			<input type = "submit" value = "管理者登録画面に戻る">
	  </form>
	</div>
</body>
</html>