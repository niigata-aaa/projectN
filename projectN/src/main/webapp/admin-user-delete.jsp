<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認画面</title>
</head>
	<style>
	    .admin-margin{
			margin-top:15px;
		}
		.admin-center{
			width: 250px;   /* 必須 */
    		margin: 0 auto;
		}
		.admin-center input[type="submit"]{
		 	border-radius:20px;
		 	background:#A9A9A9;
		}
	</style>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="user-list" name="path" />
	</jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = request.getParameter("user_id");
%>
<h2><%=user_id %>　さんを削除しますか?</h2><br>
	<div class="admin-center">
	  <form action="user-delete" method = "GET">
		<input type = "hidden" name = "user_id" value = "<%=user_id%>">
		<input type = "submit" value = "削除する">
	  </form>
	
	  <form action="user-list" method = "POST" class="admin-margin">
		<input type = "submit" value = "キャンセル">
	  </form>
	</div>

</body>
</html>