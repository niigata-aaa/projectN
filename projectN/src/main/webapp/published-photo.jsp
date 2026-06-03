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
	
	<form action="release-photo-list" method="POST">
	<div class="area-narrow-down-field">
		<div class="area-select-box">
		市町村絞り込み<br>
		<select name="area_id">
			<option value="0">すべて</option>
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
		 <div class="loginForm-button-design" style="width: 150px">
			<input type="submit" value="絞り込み">
		</div>
	</div>
	</form>
	<%
		if (photoList != null && !photoList.isEmpty()){
	%>
	<h3 style="text-align: center;">写真一覧</h3>
	<div class="published-photo-list">
	<%
		for (PhotoBean photo : photoList){
	%>
	<div class="published-photo-card">
		<div class="published-photo-image">
			<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
		</div>
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
		<h2>写真が登録されていません</h2>
	<%
	}
	%>
	</div>

</body>
</html>