<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.text.*" %>
 <%@ page import = "java.util.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title her</title>
<link href="background.css" rel="stylesheet" />
<style>
*{
margin:0px;
padding:0px;
}
body{
	background-color : #dae3ea;
}
	#D_div{
		position: absolute;
		padding-top:140px;
		padding-left:100px;
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
			<jsp:include page="header_login.html" flush="false" />
	<%	}
		else{
	%>
			<jsp:include page="header.jsp" flush="false" />
	<%	}
	%>
	<div id="D_div">
	<%
		Calendar currentCalendar = Calendar.getInstance();
	    Calendar cal = Calendar.getInstance();
	    Calendar dday= Calendar.getInstance();
	    
	    int nTotalDate1 = 0, nTotalDate2 = 0, nDiffOfYear = 0, nDiffOfDay = 0;
	    
	    int curYear =currentCalendar.get(Calendar.YEAR);  //2015
	    int curMonth =currentCalendar.get(Calendar.MONTH)+1; //6
	    int curDate =currentCalendar.get(Calendar.DAY_OF_MONTH);//2
	    int curHour = currentCalendar.get(Calendar.HOUR_OF_DAY);//15
	    int curMin = currentCalendar.get(Calendar.MINUTE);
	    int curSec = currentCalendar.get(Calendar.SECOND);
	    
		int DY=2015;
		int DM=8;
		int DD=27;
	    dday.set(DY,DM,DD);// D-day의 날짜를 입력합니다.
	     
	    long csec=currentCalendar.getTimeInMillis();
	    long dsec=dday.getTimeInMillis();
	    long count = dsec-csec;
	    long hour = (count%86400000);

	    
	     cal.set(DY, DM-1, DD);
	      nDiffOfDay = cal.get(Calendar.DAY_OF_YEAR);
	      nTotalDate1 += nDiffOfDay;

	     cal.set(curYear, curMonth-1, curDate);
	      nDiffOfDay = cal.get(Calendar.DAY_OF_YEAR);
	      nTotalDate2 += nDiffOfDay;
	      
	      int day = nTotalDate1 - nTotalDate2;
	      
	    
	%>
		<label><font face="monospace" size="3"><h1>D-day <%=day%></h1></font></label>
	</div>
	<div id="schedule_div">
		<img src="photo/schedule22.png" id="sched" width="120px" height="80px">
	</div>
	<jsp:include page="home_main.jsp" flush="false" />
	<jsp:include page="footer.html" flush="false" />
</body>
</html>