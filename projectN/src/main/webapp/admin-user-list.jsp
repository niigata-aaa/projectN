<%@page import="model.entity.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧画面</title>
</head>
	<style>
	    .admin-margin{
			margin-top:15px;
		}
		.admin-center{
			width: 250px;   /* 必須 */
    		margin: 0 auto;
		}
	
	
	
	
	</style>
<body>
	<div class="admin-center">
	  <h2 class="admin-center">ユーザ一覧</h2><br>
	  検索
	  <form action="user-list" method = "POST">
		  <input type = "text" name = "user_id"><br>
		  <select name = "post_id">
			<option value = "0">すべて表示</option>
			<option value = "1">ユーザ</option>
			<option value = "2">管理者</option>
		  </select>
		  <input type = "submit" value = "表示">
	  </form>
	  <%
		  List<UserBean> userList = (List<UserBean>)request.getAttribute("userList");
	  %>
	   <table border="1" class="admin-margin">
		 <tr>
			<th>user_id</th>
			<th>post_id</th>
			<th>　</th>
		 </tr>
		
		 <%
			 for(UserBean user : userList){
		 %>
		
		 <tr>
			<td><%=user.getUser_id()%></td>
			<td><%=user.getPost_id()%></td>		
			<td>
				<form action = "admin-user-delete.jsp" method = "GET">
					<input type = "hidden" name = "user_id" value = "<%=user.getUser_id()%>">
					<input type = "submit" value = "削除する">
				</form>
		 </tr>

		 <%} %>
	   </table>
	  </form>
	  <form action = "admin-index.jsp" method="POST" class="admin-margin">
		 <input type = "submit" value = "管理者ページに戻る">
	  </form>
	 </div>
</body>
</html>