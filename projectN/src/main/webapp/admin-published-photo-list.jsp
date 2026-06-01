<%@page import="model.entity.PhotoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真一覧画面</title>
</head>
<body>
	<%
		List<PhotoBean> adminPhotoList = (List<PhotoBean>)request.getAttribute("adminPhotoList");
	%>
	
	<%
	if (adminPhotoList != null && !adminPhotoList.isEmpty()){
	%>
	
	<h3>写真一覧</h3>
	<%
		for (PhotoBean photo : adminPhotoList){
	%>
	
	<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
	
		
	<%
		}
	
	} else {
	%>
		<h3>写真が登録されていません</h3>
	<%
	}
	%>
</body>
</html>