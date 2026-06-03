<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写真追加完了画面</title>
</head>
<body>
	<%
	List<String> photoDataList = (List<String>)request.getAttribute("photoDataList");
	%>
<jsp:include page="header.jsp" />
<h2>アルバムに写真を追加しました！</h2>
	<%
		for (String photo : photoDataList){
	%>
		<img src="${pageContext.request.contextPath}/photo/<%=photo%>" >
	<%
		}
	%>
	<form action="selected-album" method="post">
	<input type="submit" value="アルバム画面に戻る">
<!--<a href="selected-album">アルバム画面に戻る</a>-->
</body>
</html>