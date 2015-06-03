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
	<jsp:include page="header.jsp" flush="false" />
	
<div id="content_div">
	<section id="main_section">
	<img src="photo/게시판.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
		<article id="board_ariticle">
		<form method="post" action="board_write_ok.jsp">
			<table border="1" align="center" width="100%">
			<tr>
			<td >작성자</td>
			<td >작성자이름</td>
			</tr>
			<tr>
			<td >제목</td>
			<td >제목나옴</td>
			</tr>
			<tr>
			<td colspan="2">글내용나옴</td>
			</tr>
			<tr>
			<td colspan="2" align="right">
			<input type="button" value="수정"><input type="button" value="삭제"></td>
			</tr>
			</table>
		</article>
	</section>
  </div>
  </body>