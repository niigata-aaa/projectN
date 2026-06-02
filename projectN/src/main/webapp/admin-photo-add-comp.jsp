<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真登録完了画面</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="selected-album" name="path" />
	</jsp:include>

<% int cnt = (Integer)request.getAttribute("cnt"); 
	if (cnt == 1) {
%>
<h2>登録できました</h2>
<% }else{ %>
<h2>登録できませんでした</h2>
<% }%>
	   <div class="text-center">
		<form action = "admin-index.jsp" >
			<input type = "submit" value = "管理者ページに戻る">
		</form>
		  
		<form action = "admin-photo-add" method="POST">
			<input type = "submit" value = "写真登録画面に戻る">
		</form>
	   </div>
	

</body>
</html>