<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Photo Upload</title>
<style>
#btnup{
	background-color:#FFADFF;
	color:white;
	font-size:15px;
}
#btnfi{
	background-color:#CCCCFF;
	border: 1px solid gray;
	font-size:20px;
}
</style>
</head>
<body>
<center>
<form name="fileForm" id="fileForm" method="POST" action="imgup.jsp" enctype="multipart/form-data">
    <input type="text" name="title" id="title">
    <input type="file" name="uploadFile" id="uploadFile"> 
    <input type="submit" value="전송">
</form>
</center>
</body>
</html>