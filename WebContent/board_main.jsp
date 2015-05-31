<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="content.css" rel="stylesheet" />

<div id="content_div">
	<section id="main_section">
	<img src="photo/게시판.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
		<article id="board_ariticle">
			<table border="1" width="100%">
			<tr>
			<td width="10%">번호</td>
			<td width="70%">제목</td>
			<td width="10%">글쓴이</td>
			<td width="10%">조회수</td>
			</tr>
			</table>
			<div align="right">
			<img src="photo/글쓰기.png" width="70px" onclick="location='board_write.html'">
			</div>
			<br><br>
			<div align ="center">
			<img src="photo/검색Q.png" width="20px" height="20px">
			<input type="text" size="20" name="search" height="30px"> 
			<img src="photo/검색.png" width="30px" height="20px">
			</div>
		</article>
	</section>
  </div>
