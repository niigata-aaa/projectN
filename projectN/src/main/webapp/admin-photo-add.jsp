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

	<form action="admin-photo-add-comp" method="POST" enctype="multipart/form-data">
		タイトル:<input type="text" name="title">
<br>
		<select name="area_id">
	   <%
	   	  List<AreaBean> areaList = (List<AreaBean>) request.getAttribute("areaList");
	      for(AreaBean area : areaList){
	   %>
	     <%int id = area.getArea_id(); %>
			<option value="<%=id%>"><%=area.getArea_id() %>:<%=area.getArea_name() %></option>
		<%
	      }
		%>
		</select>
		<br>
		<input type="file" id="photo" name="photo">
		<br>
		<input type="submit" value="登録">
	</form>


</body>
</html>