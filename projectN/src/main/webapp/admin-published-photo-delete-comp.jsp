<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		削除できました<br>
		<input type="button" onclick = "location.href" 
		  ='admin-index.jsp' value="管理者ページに戻る">
		  
		<form action = "admin-photo-list" method="POST">
			<input type = "submit" value = "公開写真一覧に戻る">
		</form>

</body>
</html>