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
	<style>
		h2 {
			text-align:center;
			}
		form{
			display:inline-block;
		}
		.admin-div{
			text-align:center;
			margin-bottom:10px;
		}
		input[type="submit"] {
			/* 1.形をきめる */
			width: 280px;
			height: 55px;
			border: none;
		}
		.admin-margin{
			margin-top:15px;
		}
	</style>

<body>
	<jsp:include page="header.jsp">
		<jsp:param value="selected-album" name="path" />
	</jsp:include>
	
	<h2>公開写真登録</h2>
	<div class="admin-div">
	 <form action="admin-photo-add-comp" method="POST" enctype="multipart/form-data">
		 タイトル:<input type="text" name="title" required maxlength="50"><br>
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
		 <input type="file" id="photo" name="photo" required accept="image/*">
		 <br>
		 <input type="submit" value="登録" class="admin-margin">
	 </form>
	</div>


</body>
</html>