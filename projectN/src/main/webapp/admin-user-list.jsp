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
		<input type = "text" name = "user_id"><br>
		<select name = "post_id">
			<option value = "0">すべて表示</option>
			<option value = "1">ユーザ</option>
			<option value = "2">管理者</option>
		</select>
		<input type = "submit" value = "表示">
	</form>
	<%
		List<UserBean> userList = (List)request.getAttribute("userList");
	%>
	<table>
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
<!--			<td><dialog>-->
<!--				<p>本当に削除しますか</p>-->
<!--				<button id="close">キャンセル</button>-->
<!--				<form action = "user-delete" method = "GET">-->
<!--					<input type = "hidden" name = "user=id" value = "<%=user.getUser_id()%>">-->
<!--					<input type = "submit" value = "削除する">-->
<!--				</form>-->
<!--			</dialog>-->
<!--			<button id="show">削除</button>-->
<!--			<td>-->
			<td>
				<form action = "user-delete" method = "GET">
					<input type = "hidden" name = "user_id" value = "<%=user.getUser_id()%>">
					<input type = "submit" value = "削除する">
				</form>
		</tr>

		<%} %>
	</table>
	

</body>
</html>