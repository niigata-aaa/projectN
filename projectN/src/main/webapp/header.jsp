<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.UserBean"%>

<link rel="stylesheet" href="Style.css">

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
				<li><a href="login.jsp">ログイン</a></li>
				<li><a href="user-regi.jsp">会員登録</a></li>
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
				<%
					if(request.getParameter("path") != null){
				%>
				<li><a href="<%= request.getParameter("path") %>">戻る</a></li>
				<%
					}
				%>
			</ul>
		</nav>
	</div>
</header>