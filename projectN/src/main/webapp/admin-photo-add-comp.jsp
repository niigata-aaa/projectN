<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真登録完了画面</title>
</head>
<body>

<% int cnt = (Integer)request.getAttribute("cnt"); 
	if (cnt == 1) {
%>
登録できました
<% }else{ %>
登録できませんでした
<% }%>

		<input type="button" onclick = "location.href" ='admin-index.jsp' value="管理者ページに戻る">
		  
		<form action = "admin-photo-add" method="POST">
			<input type = "submit" value = "写真登録画面に戻る">
		</form>

</body>
</html>