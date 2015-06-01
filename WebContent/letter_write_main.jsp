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
body{
	background-color : #dae3ea
}</style>
</head>
<body>
	<jsp:include page="header.html" flush="false" />
<div id="content_div">
	<section id="main_section">
	<img src="photo/letter.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
		<article id="board_ariticle">
		<form method="post" action="board_write_ok.jsp">
			<table border="1" align="center">
			<tr>
			<td >제목</td>
			<td ><input type="text" name="title" id="title" size="100"></td>
			</tr>
			<tr>
			<td colspan="2">
			<textarea rows="20" cols="110"></textarea></td>
			</tr>
			<tr>
			<td colspan="2" align="right">
			<input type="submit" value="등록"></td>
			</tr>
			</table>
		</article>
	</section>
  </div>