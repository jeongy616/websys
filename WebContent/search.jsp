<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>'<%=request.getParameter("search") %>' 검색결과</title>
<link href="background.css" rel="stylesheet" />
</head>
<body>
	<%
		String state = request.getParameter("state");

		if(state.equals("board")){
	%>
			<jsp:include page="header.jsp" flush="false" />
			<jsp:include page="board_search.jsp" flush="false" />
			<jsp:include page="footer.html" flush="false" />
	<%	}
		else{
	%>
			<jsp:include page="header.jsp" flush="false" />
			<jsp:include page="letter_search.jsp" flush="false" />
			<jsp:include page="footer.html" flush="false" />
	<%	}
	%>

</body>
</html>