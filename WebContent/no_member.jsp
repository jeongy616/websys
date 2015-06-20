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
}
label{
	cursor: pointer;
	hover: white;
}</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	
 <div id="content_div">
	<section id="main_section">
	<hr color="#4e4b4b"/><br/><br/>
		<article id="board_ariticle">
		<div align="center">
		<h4>
			이곳은 회원전용 게시판입니다.<br>
			이용을 원하시면 로그인해주세요.<br><br>
			<input type="image" src="photo/Login.jpg" width="45px" onclick="location='login.jsp'" >
			<input type="image" src="photo/Join.jpg" width="45px" onclick="location='join.jsp'">
		</h4>
		</div>
		</article>
	</section>
  </div>
  
	<jsp:include page="footer.html" flush="false" />
</body>
</html>