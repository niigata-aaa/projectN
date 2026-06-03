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
	PhotoBean photo = (PhotoBean) request.getAttribute("photo");
	int cnt = (Integer) request.getAttribute("cnt");
	%>
	<%
	if (cnt == 1) {
	%>
	<h2>登録完了</h2>
	<%
	} else {
	%>
	<h2>写真を登録できませんでした</h2>
	<%
	}
	%>
	公開設定を変更した写真
	<br>
	<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>">
	<form action="selected-album" method="GET">
		<div class="loginForm-button-design">
			<input type="submit" value="アルバム画面に戻る">
		</div>
	</form>
<!--	<a href="selected-album">アルバム画面に戻る</a>-->

</body>
</html>