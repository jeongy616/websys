<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title her</title>
<link href="background.css" rel="stylesheet" />
<style>
body{
	background-color : #dae3ea;
}
	#schedule_div{
		position: absolute;
		height: 800px;
		width: 500px;
		background: skyblue;
		left: -500px;
		top: 0px;
		z-index: 1000;
	}
	#sched {
		position: absolute;
		right: -120px;
		bottom: 250px;
		cursor: pointer;
	}
</style>
<script src="jquery-1.11.3.min.js"></script>
<script>
	var isOpen = false;
	$(function(){
		$('#sched').click(function(){
			if (!isOpen) {
				$('#schedule_div').animate({left: "0px"}, 1000, function() {
					$('#sched').attr('src', 'photo/schedule11.png');
				});
				isOpen = true;
			} else {
				$('#schedule_div').animate({left: "-500px"}, 1000, function() {
					$('#sched').attr('src', 'photo/schedule22.png');
				});
				isOpen = false;
			}
		});
	});
</script>
</head>
<body>
	<%
		String loginid = (String)session.getAttribute("loginID");
		boolean isLogin = false;
		if(loginid!=null){
			isLogin = true;
		}
		if(isLogin){
	%>
			로그인완료 <%=loginid %>
			<jsp:include page="header_login.html" flush="false" />
	<%	}
		else{
	%>
			<jsp:include page="header.jsp" flush="false" />
	<%	}
	%>
	<div id="schedule_div">
		<img src="photo/schedule22.png" id="sched" width="120px" height="80px">
	</div>
	<jsp:include page="home_main.jsp" flush="false" />
	<jsp:include page="footer.html" flush="false" />
</body>
</html>