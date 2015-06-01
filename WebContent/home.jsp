<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title her</title>
<link href="background.css" rel="stylesheet" />
<style>
body{
	background-color : #dae3ea
}</style>
</head>
<body>
	<%
		String loginid = (String)session.getAttribute("loginID");
		boolean isLogin = false;
		if(loginid!=null){
			isLogin = true;
		}
		if(isLogin){
	%>
			로그인완료 <%=loginid %>
			<jsp:include page="header_login.html" flush="false" />
	<%	}
		else{
	%>
			<jsp:include page="header.html" flush="false" />
	<%	}
	%>

	<jsp:include page="home_main.jsp" flush="false" />
	<jsp:include page="footer.html" flush="false" />
</body>
</html>