<%@page import="model.entity.AreaBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真登録</title>
</head>
<body>
	<form action="admin-photo-add" method="POST">
		タイトル<input type="text" name="title">
		写真挿入まだ
		<select name="area">
	   <%
	   	  List<AreaBean> areaList = (List<AreaBean>) request.getAttribute("areaList");
	      for(AreaBean area : areaList){
	   %>
			<option value<%=area.getArea_id() %>><%=area.getArea_name() %></option>
		
		<%
	      }
		%>
		</select>
	</form>
	<button type="submit" class="admin-photo-add-comp">登録</button>

</body>
</html>