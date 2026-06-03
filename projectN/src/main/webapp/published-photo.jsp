<%@page import="model.entity.AreaBean"%>
<%@page import="model.entity.UserBean"%>
<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公開写真一覧</title>
<link rel="stylesheet" href="Style.css">
<style>
.area-narrow-down-field {
	width: 40%;
	display: flex;
	margin: auto;
}

.area-select-box {
	font-size: 25px;
	text-align: center;
}
.area-select-box select{
	font-size: 20px;
	width: 100%;
}

.published-photo-list {
	display: flex;
	flex-wrap:wrap;
	justify-content:space-around;
	height: 500px;
	overflow: scroll;
}
.published-photo-card {
	margin-top: 20px;
	background: rgba(255, 255, 255, 0.95);
	border: 1px solid #ccc;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
	width: 450px;           
	height: 350px;
	box-sizing: border-box;
	display: block;
	pointer-events: none;
}

.published-photo-card img {
width: 100%;
	height: 250px;
	box-sizing: border-box;
	object-fit: cover;
	border-radius: 4px;
}

.published-photo-info {
	margin-top: 10px;
	font-size: 14px;
	font-weight: bold;
	color: #333;
	word-break: break-all;
	min-height: 20px;
	max-height: 40px;
	overflow: hidden;
}
</style>
</head>
<body>
	<%
	UserBean loginUser = (UserBean)session.getAttribute("loginUser");
	String url = "";
	if(loginUser != null){
		url = "general-user-top";
	}else{
		url = "main-top";
	}
	%>
	<jsp:include page="header.jsp">
		<jsp:param value="<%= url %>" name="path" />
	</jsp:include>
	<%
		List<PhotoBean> photoList = (List<PhotoBean>)request.getAttribute("photoList");
		List<AreaBean> areaList = (List<AreaBean>) request.getAttribute("areaList");
	%>
	
	<%
		if (photoList != null && !photoList.isEmpty()){
	%>
	<form action="release-photo-list" method="POST">
	<div class="area-narrow-down-field">
		<div class="area-select-box">
		市町村絞り込み<br>
		<select name="area_id">
	    <%
	       for(AreaBean area : areaList){
	    %>
	      <%int id = area.getArea_id(); %>
			<option value="<%=id%>"><%=area.getArea_id() %>:<%=area.getArea_name() %></option>
		 <%
	       }
		 %>
		 </select>
		 </div>
		 <div class="loginForm-button-design">
			<input type="submit" value="絞り込み" style="margin: 0 auto;">
		</div>
	</div>
	</form>
	<h3 style="text-align: center;">写真一覧</h3>
	<div class="published-photo-list">
	<%
		for (PhotoBean photo : photoList){
	%>
	<div class="published-photo-card">
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
		<div class="published-photo-info">
		<%=photo.getArea_name ()%>
		<div style="text-align: center; font-size: 14px"><%=photo.getPhoto_title ()%></div>
		</div>
	</div>
	<%
		}
	%>
	
	<% 
		} else {
	%>
		<h3>写真が登録されていません</h3>
	<%
	}
	%>
	</div>

</body>
</html>