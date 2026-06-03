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
	List<String> photoDataList = (List<String>) request.getAttribute("photoDataList");
	%>
<<<<<<< HEAD
<jsp:include page="header.jsp" />
<h2>アルバムに写真を追加しました！</h2>
=======
	<jsp:include page="header.jsp" />
	<h1 style="text-align: center;">アルバムに写真を追加しました！</h1>
>>>>>>> refs/remotes/origin/master
	<%
	for (String photo : photoDataList) {
	%>
	<div class="photo-card">
		<div class="photo-card-image">
			<img src="${pageContext.request.contextPath}/photo/<%=photo%>">
		</div>
	</div>
	<%
	}
	%>
	<form action="selected-album" method="POST">
		<div class="loginForm-button-design">
			<input type="submit" value="アルバム画面に戻る">
		</div>
	</form>
>>>>>>> refs/remotes/origin/master
</body>
</html>