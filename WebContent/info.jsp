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
.info {
	width: 180px;
	height: 130px;
	margin-left: 15px;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="content_div">
	<img src="photo/info/scandal.PNG" class="info">
	<img src="photo/info/toproom.PNG" class="info">
	<img src="photo/info/miss.PNG" class="info">
	<img src="photo/info/3days.PNG" class="info">
	<img src="photo/info/seafog.PNG" class="info">
	</div>
	<jsp:include page="footer.html" flush="false" />
</body>
 </body>
</html>
