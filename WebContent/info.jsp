<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.lang.*,java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Info</title>
 </head>
<link href="background.css" rel="stylesheet" />
<link href="content.css" rel="stylesheet" />
<style>
.thumbnail {
	width: 150px;
	height: 100px;
	margin-left: 15px;
	cursor: pointer;
}
</style>
<script>
$(".thumbnail").mouseover()
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="content_div">
	<% 
	try
		{
		File folder = new File(application.getRealPath("/photo/info"));
	    for( File f : folder.listFiles()){
	%>
	    <img src="/websys/photo/info/<%=f.getName()%>" class='thumbnail'/>  	
	<%
	    	}
		}catch(Exception ex){
	    }
	 %>
	</div>
	<jsp:include page="footer.html" flush="false" />
</body>
 </body>
</html>
