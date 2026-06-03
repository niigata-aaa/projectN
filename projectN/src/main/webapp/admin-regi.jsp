<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者登録画面</title>
</head>
	<style>
		.admin-center{
			width: 250px;   /* 必須 */
    		margin: 0 auto;
		}
		.admin-margin{
			margin-top:15px;
		}
	</style>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="selected-album" name="path" />
	</jsp:include>
	
	<% 
		String ErrorMessage = null;
	 	ErrorMessage = (String)request.getAttribute("ErrorMessage"); 
	%>
	
	<%
		if (ErrorMessage != null){	
	%>
		<%=ErrorMessage %>
	<%
		}
	%>
	
	<h2>管理者登録</h2>
	  <form action="admin-register" method = POST class="loginForm-design">
		 ID<input type = "text" name = id><br>
		 パスワード<input type = "password" name = "password"><br>
		<div class="admin-center">
		 <input type = "submit" value = 登録 class="admin-margin">
	    </div>
	  </form>
	<form action="admin-register" method = POST>
		ID<input type="text" name="id" required maxlength="100"><br>
		パスワード<input type="password" name ="password" required minlength="8"><br>
		<input type ="submit" value ="登録">
	</form>
	
</body>
</html>