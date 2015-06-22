<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Letter</title>
</head>
<link href="background.css" rel="stylesheet" />
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
			<jsp:include page="header.jsp" flush="false" />
			<jsp:include page="letter_main.jsp" flush="false" />
			<jsp:include page="footer.html" flush="false" />
	<%	}
		else{
	%>
			<jsp:forward page="no_member.jsp" />
	<%	}
	%>
</body>
</html>