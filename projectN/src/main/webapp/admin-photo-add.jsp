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
		form{
			display:inline-block;
		}
		.admin-div{
			text-align:center;
			margin-bottom:10px;
		}
		.admin-center-mini input[type="submit"]{
			font-size:17px;
			width:70px;
			height:40px;
		 	border-radius:5px;
		 	background:#A9A9A9;
		}
		.admin-margin{
			margin-top:15px;
		}
	</style>

<body>
	<jsp:include page="header.jsp">
		<jsp:param value="admin-index.jsp" name="path" />
	</jsp:include>
	
	<h2>公開写真登録</h2>
	<div class="loginForm-design">
	 <form action="admin-photo-add-comp" method="POST" enctype="multipart/form-data">
		 タイトル<span style="color: red;">*</span><input type="text" name="title" required maxlength="50"><br>
		 市町村<span style="color: red;">*</span>
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
		<div class="admin-center-mini"> 
		 <input type="submit" value="登録" class="admin-margin">
	    </div>
	 </form>
	</div>


</body>
</html>