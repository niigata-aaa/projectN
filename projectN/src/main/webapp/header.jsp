<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.UserBean"%>

<!--cssファイルに書く予定-->
<style>
    body {
        font-family: sans-serif;
        margin: 0;
    }
    .site-header {
        background-color: #333;
        color: #fff;
        padding: 15px;
    }
    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1000px;
        margin: 0 auto;
    }
    .global-nav ul {
        list-style: none;
        display: flex;
        gap: 15px;
        padding: 0;
    }
    .global-nav a {
        color: #fff;
        text-decoration: none;
    }
</style>

<header class="site-header">
	<div class="header-container">
		<h1 class="site-title">にいカイブ</h1>
		<nav class="global-nav">
			<ul>
				<%
				// セッションからログインユーザー情報を取得
				UserBean user = (UserBean) session.getAttribute("loginUser");

				if (user == null) {
					// ログインしていない場合
				%>
				<li><a href="user-regi.jsp">ログイン</a></li>
				<li><a href="login.jsp">会員登録</a></li>
				<%
				} else {
				%>

					<%
					// ログインしている場合
					// 管理者判定
					if (user.getPost_id() == 2) {
					%>
						<li><a href="admin-top">管理者トップ</a></li>
					<%
					}
					%>
					<li><a href="logout">ログアウト</a></li>
				<%
				}
				%>
			</ul>
		</nav>
	</div>
</header>