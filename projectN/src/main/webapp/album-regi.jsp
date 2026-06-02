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
<<<<<<< HEAD
		<jsp:param value="general-user-top" name="path" />
	</jsp:include>
	<h1>新規アルバム作成</h1>

	<div class="album-regi-style">
		<form action="album-register" method="POST">
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
			<label>写真登録</label><input type="file" name="photoRegistration">
			<br>
	</div>
	<input type="submit" value="作成" style="margin:0 auto; margin-top:5px;">
	</form>
	</div>

=======
		<jsp:param value="album-list" name="path" />
	</jsp:include>
	<h1>新規アルバム作成</h1>
	<form action="album-register" method="POST" enctype="multipart/form-data">
		アルバム名<input type="text" name="albumName"><br>
		日付<input type="date" name="startDate">～
		<input type="date" name="endDate"><br>
		同行者<input type="text" name="companion"><br>
		メモ<textarea name="memo"></textarea><br>
		写真登録<input type="file" name="photoRegistration" multiple> <br>
		<br>
	<input type="submit" value="作成">
	</form>
>>>>>>> refs/remotes/origin/master

</body>
</html>