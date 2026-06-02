<%@page import="model.entity.AlbumBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム情報編集確認画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div>
	  <div class="loginForm-design">
		<%
		AlbumBean editAlbum = (AlbumBean) session.getAttribute("editAlbum");
		%>
		アルバム名 : <%= editAlbum.getAlbum_name() %> <br> 
		日付 : <%= editAlbum.getTrip_start() %> ～ <%= editAlbum.getTrip_end() %><br> 
		同行者 : <%= editAlbum.getCompanion() %><br> 
		メモ : <%= editAlbum.getMemo() %><br>
		<p class="text-center">以上の項目で編集しますか？</p><br>
	  </div >
	   <div class="text-center">
			<form action="album-edit" method="get" >
				<input type="submit" value="登録" class="loginForm-button-design">
			</form>
			<form action="album-edit.jsp" method="get">
				<input type="submit" value="キャンセル" class="loginForm-button-design">
			</form>
	   </div >
	</div>

</body>
</html>