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
	
<div id="schedule_div">
	<img src="photo/schedule1.png" id="sched" width="120px" height="80px" onclick="location='schedule.html'">
</div>
<div id="content_div">
	<section id="main_section">
	<form method="post" action="login_check.jsp">
		<table border="0" cellpadding="0" cellspacing="0" width="900">
 			<tr>
  <th width="200">아이디 </th>
  <td><input type="text" size="20" name="inputid"></td>
 </tr>

 <tr>
  <th width="200">비밀번호</th>
  <td><input type="password" size="21" name="inputpw"></td>
 </tr>
 
 <tr>
  <td colspan="2" class="bottom">
  <input type="submit" value="로그인" ><input type="button" value="회원가입" onclick="location='join.jsp'">
  </td>
 </tr>
 </table>
</form>
	</section>
</div><!--여기까지 section-->
  
	<jsp:include page="footer.html" flush="false" />
</body>
</html>