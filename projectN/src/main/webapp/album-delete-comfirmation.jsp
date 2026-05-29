<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アルバム削除確認画面</title>
</head>
<body>
<form action="album-delete" method="POST">
<p>テスト</p>
<script>
ret=window.confirm("アルバムを削除しますか？");
document.write(ret);
</script>

</body>
</html>