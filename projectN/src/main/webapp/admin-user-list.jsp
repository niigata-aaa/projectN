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
<body>
	<form action="user-list" method = "POST">
		<input type = "text" name = "post_id">
		<input type = "submit" value = "表示">
	</form>
	<%
		List<UserBean> userList = (List)request.getAttribute("userList");
	%>
	<table>
		<tr>
			<th>user_id</th>
			<th>post_id</th>
			<th></th>
		</tr>
		
		<%
			for(UserBean user : userList){
		%>
		
		<tr>
			<td><%=user.getUser_id()%></td>
			<td><%=user.getPost_id()%></td>
			<td><dialog open>
				<p>本当に削除しますか</p>
				<button>キャンセル</button>
				<input type = "submit" value = "削除する">	
		</tr>
		
		<%} %>
	</table>
</body>
</html>