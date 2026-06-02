<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写真追加画面</title>
</head>
<body>
<jsp:include page="header.jsp">
	<jsp:param value="selected-album" name="path" />
</jsp:include>
<!--<form action="" method="POST" enctype="multipart/form-data">-->
<form action="album-photo-add" method="POST" enctype="multipart/form-data">
<label for="logo">画像:</label>
	<div class="td" style="text-align:center">
		<input type="file" id="photo" name="photo" multiple required accept="image/*">
		<div class="loginForm-button-design"><input type="submit" value="登録"></div>
	</div>
</body>
</html>