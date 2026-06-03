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
			margin: 0 auto;
		}
		.admin-center{
			width: 450px;   /* 必須 */
    		margin: 0 auto;
		}
		tr{
			border-radius :8px;
  			box-shadow :0px 0px 5px silver;
  			padding: 0.5em 0.5em 0.5em 2em;
  			scroll-snap-align:start;
		}
		tr,th{
			line-height: 1.5;
  			padding: 0.5em 0;
		}
		.admin-back{
			background: #DDDDDD;
			width:450px;
			border-radius:20px;
			background-position:center;
			text-align:center;
			padding-bottom:3px;
			
		}
		.admin-center input[type="submit"]{
		 	background:#808080;
		 	display:block;
		 	margin:20px auto;
		}
		
		.table-area{
		height:400px;
		overflow-y:auto;
		scroll-snap-type:y mandatory;
		}
		
	</style>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="admin-index.jsp" name="path" />
	</jsp:include>

	<div class="admin-center">
	  <h2 >ユーザ一覧</h2>
	  
	 <div class="admin-back">
	  <form action="user-list" method = "POST">
	  		検索:
		  <input type = "text" name = "user_id"><br>
		  <select name = "post_id">
			<option value = "0">すべて表示</option>
			<option value = "1">ユーザ</option>
			<option value = "2">管理者</option>
		  </select>
		  <input type = "submit" value = "表示" class="admin-margin">
	   </form>
	   <%
		  List<UserBean> userList = (List<UserBean>)request.getAttribute("userList");
	   %>
	   <div class= "table-area">
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
				<form action = "admin-user-delete.jsp" method = "GET" class="admin-btn">
					<input type = "hidden" name = "user_id" value = "<%=user.getUser_id()%>">
					<input type = "submit" value = "削除する">
				</form>
		 </tr>

		 <%} %>
	    </table>
	    </div>
	   </form>
	   <form action = "admin-index.jsp" method="POST" class="admin-margin">
		 <input type = "submit" value = "管理者ページに戻る" class="admin-btn">
	   </form>
	  </div>
	 </div>
</body>
</html>