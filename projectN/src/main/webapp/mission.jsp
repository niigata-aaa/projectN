<%@page import="model.entity.MissionPhotoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param value="album-list" name="path" />
	</jsp:include>
<!--<div>-->
<!--①ゆるキャラ-->
<!--<%-->
<!--		List<MissoinPhotoBean> mission = (List<MissionPhotoBean>)request.getAttribute("mission");-->
<!--		String photoCnt = (String)mission.getMission_photo_data();-->
<!--	%>-->
<!--	<%-->
<!--		if (photoCnt != null ){-->
<!--	%>-->
<!--	<h3>写真</h3>-->
<!--		<div>-->
<!--		<img src="${pageContext.request.contextPath}/photo/<%=photo.getPhoto_data()%>" ><br>-->
<!--		タイトル：-->
<!--		<% if(photo.getPhoto_title() != null) {%>-->
<!--			<%= photo.getPhoto_title() %>-->
<!--		<% } else { %>-->
<!--			未設定-->
<!--		<% } %><br>-->
<!--		<form action="release-setting" method="POST">-->
<!--		<input type="hidden" name="photo_id" value="<%=photo.getPhoto_id()%>">-->
<!--		<input type="submit" value="公開設定">-->
<!--		</form>-->
<!--		<% if(photo.getIs_published() == 0) {%>-->
<!--			非公開-->
<!--		<% } else { %>-->
<!--			公開-->
<!--		<% } %>-->
<!--		</div>-->
<!--	<%-->
<!--		}-->
<!--	} else {-->
<!--	%>-->
<!--		<h3>写真が登録されていません</h3>-->
<!--	<%-->
<!--	}-->
<!--	%>-->
<!--</div>-->

</body>
</html>