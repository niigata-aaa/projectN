<%@page import="model.entity.PhotoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録完了</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	PhotoBean photo = (PhotoBean)request.getAttribute("photo");
	int cnt = (Integer) request.getAttribute("cnt");
	%>
	<%
	if (cnt == 1) {
	%>
	<p>登録完了
	<%
	}
	%>
	公開設定を変更した写真
	<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" >
	
		<a href="selected-album">modoru</a>
</body>
</html>