<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="background.css" rel="stylesheet" />
</head>
<body>
	<%
		String state = request.getParameter("state");

		if(state.equals("board")){
	%>
			<jsp:include page="header_login.jsp" flush="false" />
			<jsp:include page="board_search.jsp" flush="false" />
			<jsp:include page="footer.html" flush="false" />
	<%	}
		else{
	%>
			<jsp:include page="header_login.jsp" flush="false" />
			<jsp:include page="letter_search.jsp" flush="false" />
			<jsp:include page="footer.html" flush="false" />
	<%	}
	%>

</body>
</html>