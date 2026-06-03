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
	市町村絞り込み
	<form action="release-photo-list" method="POST">
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
		 <div class="loginForm-button-design">
			<input type="submit" value="絞り込み" style="margin: 0 auto;">
		</div>
	</form>
	<h3>写真一覧</h3>
	<div id="published-photo-card">
	<%
		for (PhotoBean photo : photoList){
	%>
		<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
		<%=photo.getArea_name ()%>:
		<%=photo.getPhoto_title ()%>
	<%
		}
	%>
	</div>
	<% 
		} else {
	%>
		<h3>写真が登録されていません</h3>
	<%
	}
	%>

</body>
</html>