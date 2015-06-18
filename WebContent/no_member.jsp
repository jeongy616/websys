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
		<p>
			사용권한이 없습니다.<br>
			 <label onclick="location='login.jsp'">로그인 </label><label onclick="location='join.jsp'">회원가입</label>
		</p>
		</div>
		</article>
	</section>
  </div>
  
	<jsp:include page="footer.html" flush="false" />
</body>
</html>