<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<form method="post" enctype="multipart/form-data" action="imgup.jsp">
<input type="file" name="filename1" size="60" id="btnfi"><br>
<input type="submit" value="업로드" id="btnup"><br><br>
</form>
</center>
</body>
</html>