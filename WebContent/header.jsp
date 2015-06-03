<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="header.css" rel="stylesheet" />
<script src="jquery-1.11.3.min.js"></script>
 <div id="header_div">
	<header id="main_header">
		<nav id="shortcut">
			<input type="button" value="facebook">
			<input type="button" value="C-jes">
		</nav>
		<img src="photo/title.png" id="title" height="100px" onclick="location='home.jsp'">
		<div id="login">
			<button id="in" name="in" onclick="location='login.jsp'"><img src="photo/login.png" width="45px" ></button>
			<button id="join" name="join" onclick="location='join.jsp'"><img src="photo/join.png" width="45px" ></button>
		</div>
	</header>
	<nav id="menu">
		<ul >
			<li id="home"><a href="home.jsp">Home</a></li>
			<li id="info"><a href="info.jsp">Info</a>
			<li id="photo"><a href="photo.jsp">Photo</a></li>
			<li id="video"><a href="video.jsp">Video</a></li>
			<li id="board"><a href="board.jsp"> Board </a></li>
			<li id="letter"><a href="letter.jsp"> Letter</a></li>
			<li id="support"><a href="support.jsp">Support</a>
		</ul>
	</nav>
</div> 