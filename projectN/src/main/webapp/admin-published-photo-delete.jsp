<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者公開写真 削除確認画面 </title>
</head>
<body>
	<jsp:include page="header.jsp"/>

	
		<% request.setCharacterEncoding("UTF-8");
		   int photo_id =Integer.parseInt(request.getParameter("photo_id"));
		%>
		本当に削除しますか？<br>
		<form action = "admin-photo-list" method="POST">
			<input type = "submit" value = "キャンセル">
		</form>
		  
		<form action = "admin-photo-delete" method="POST">
		<input type="hidden" name="photo_id" value="<%=photo_id%>">
			<input type = "submit" value = "削除する">
		</form>

</body>
</html>