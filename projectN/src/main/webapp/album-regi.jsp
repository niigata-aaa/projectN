<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規アルバム登録画面</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="album-list" name="path" />
	</jsp:include>
	<br>
	<div class="ribbon5">
	<h1>新規アルバム作成</h1>
	</div>

	<div class="album-regi-style">
		<form action="album-register" method="POST"  enctype="multipart/form-data">
			<div class="form-group">
				<label>アルバム名</label><input type="text" name="albumName"><br>
			</div>
			<div class="form-group">
				<label>日付</label><input type="date" name="startDate">～ <input
					type="date" name="endDate"><br>
			</div>
			<div class="form-group">
				<label>同行者</label><input type="text" name="companion"><br>
			</div>
			<div class="form-group">
				<label>メモ</label>
				<textarea name="memo"></textarea>
				<br>
			</div>
			<label>写真登録</label><input type="file" name="photoRegistration"  multiple>
			<br>
			<div class = "loginForm-button-design">
			<input type="submit" value="作成" style="margin:0 auto; margin-top:5px;">
			</div>
	</form>
	</div>
</body>
</html>