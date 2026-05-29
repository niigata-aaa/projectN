<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム情報編集確認画面</title>
</head>
<body>
<form action="album-edit" method="POST">
<%--フォームに入力した情報を表示したいが分からん --%>
以上の項目で登録しますか？<br>
<br>
<input type="submit" value="登録">
</form>

<form action = "album-edit.jsp" method="get">
<input type="submit" value="キャンセル">
</form>

</body>
</html>