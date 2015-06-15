<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.lang.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="background.css" rel="stylesheet" />
<link href="content.css" rel="stylesheet" />
<style>
body{
	background-color : #dae3ea
}

.thumbnail {
	width: 150px;
	height: 100px;
	margin-left: 20px;
	cursor: pointer;
}
</style>
<script src="jquery-1.11.3.min.js"></script>
<script>

	$(function() {
		$('.thumbnail').click(function() {
			location.href = this.src;
		});
	});
	
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />

<div id="content_div">
	<%
		File folder = new File(application.getRealPath("/photo/images"));
	    for( File f : folder.listFiles()){
	%>
	    	<img src="/websys/photo/images/<%=f.getName()%>" class='thumbnail'/>  	
	<%
	    }
	%>
</div>
  
	<jsp:include page="footer.html" flush="false" />
</body>
</html>