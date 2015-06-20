<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="background.css" rel="stylesheet" />
<link href="content.css" rel="stylesheet" />
<style>
th{
	width:20%;
	text-align:center;
	background-color: rgba(102, 153, 255,0.6);
}
table{
	width:60%;
	border:0px;
}
</style>
</head>
<body>
	<% String loginid = (String)session.getAttribute("loginID"); %>
	<jsp:include page="header.jsp" flush="false" />
<div id="content_div">
	<img src="photo/게시판.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
	<center>
		<form method="post" action="board_write_ok.jsp">
			<table border="1" bgcolor="white">
			<tr>
			<th>작성자</th>
			<td ><input type="text" name="userid" size="30" disabled="disabled" value=" <%= loginid %>"></td>
			</tr>
			<tr>
			<th>제목</th>
			<td><input type="text" name="title" size="70"></td>
			</tr>
			<tr>
			<td colspan="2">
			<textarea rows="20" name="text" cols="110"></textarea></td>
			</tr>
			<tr>
			<td colspan="2" align="right" border="0">
			<input type="submit" value="등록"></td>
			</tr>
			</table>
			</form>
	</center>
  </div>
  </body>