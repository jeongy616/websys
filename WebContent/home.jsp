<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.text.*" %>
 <%@ page import = "java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title her</title>
<link href="background.css" rel="stylesheet" />
<script src="jquery-1.11.3.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />

	<div id="main_div">
		<jsp:include page="home_main.jsp" flush="false" />
	</div>
	<jsp:include page="footer.html" flush="false" />
	

	
</body>
</html>