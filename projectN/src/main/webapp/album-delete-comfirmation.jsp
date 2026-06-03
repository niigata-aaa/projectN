<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム削除確認画面</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int album_id = Integer.parseInt(request.getParameter("deleteAlbum_id"));
String album_name = request.getParameter("deleteAlbum_name");
%>
<jsp:include page="header.jsp">
		<jsp:param value="general-user-top" name="path" />
	</jsp:include>
	
<h2>アルバム『<%=album_name %>』を削除しますか</h2>
<!--	<form action="selected-album" method = "POST">-->
<!--		<div class = "loginForm-button-design">-->
<!--			<input type = "submit" value = "キャンセル">-->
<!--		</div>-->
<!--	</form>-->
	<form action = "album-delete" method = "POST">
	<input type = "hidden" name = "album_id" value = "<%=album_id %>">
	<input type = "hidden" name = "album_name" value = "<%=album_name %>">
		<div class = "loginForm-button-design">
			<input type = "submit" value = "削除する">
		</div>
	</form>
	<form action="selected-album" method = "POST">
		<div class = "loginForm-button-design">
			<input type = "submit" value = "キャンセル">
		</div>
	</form>

</body>
</html>