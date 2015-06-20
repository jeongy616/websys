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
#b_info{
	overflow:auto;width:100%;height:260;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="content_div">
		<div id="main_div">
			<img src="photo/main2.JPG" width="80%">
		</div>
		<div id="b_info">
			<span style="font-size:11pt;color:#000000;line-height:160%;">
			이름 : 박유천 <br />
			생년월일 : 1986.06.04 <br />
			혈액형 : O <br />
			학력 : 경희대학교 포스트모던음악학과 <br />
			취미 : 작곡, RC Car driving & 튜닝 <br />
			<font color=FF6674 size=5 face=Tahoma><b>━</b></font><br /><Br>
			<font face=Tahoma><b>Drama</b> <br />2015 SBS 냄새를보는소녀 - 최무각 <br />
			2014 SBS 쓰리데이즈 - 한태경 <br />
			2012-13 MBC 보고싶다 - 한정우  <br />
			2012 SBS 옥탑방왕세자 - 이각 <br />
			2011 MBC 미스리플리 - 송유현  <br /> <br />
			<b>Movie</b> <br /> 2014 해무 - 동식 <br />
			<b>Awards</b><br />
			2015 제51회 백상예술대상 영화 남자신인연기상<br />
			2015 제10회 맥스무비 최고의 영화상 남자 신인배우상<br />
			2015 제6회 올해의영화상 신인남우상<br />
			2014 SBS 연기대상 미니시리즈부문 남자 최우수연기상<br />
			2014 SBS 연기대상 10대스타상<br />
			2014 영화배우협회 스타의 밤 한국영화 인기스타상 <br />
			<br />
			<br />
			<br />
			</span>
		</div>
		
		<div>
		<img src="photo/info/scandal.PNG" class="info" >
		<img src="photo/info/toproom.PNG" class="info">
		<img src="photo/info/miss.PNG" class="info">
		<img src="photo/info/3days.PNG" class="info">
		<img src="photo/info/seafog.PNG" class="info"><br>
		</div>
	</div>
	<jsp:include page="footer.html" flush="false" />
</body>
 </body>
</html>
