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
 <%
   // 2010 남아공 월드컵
  int DdayYear = 2010;
   int DdayMonth = 6;
   int DdayDate = 11;
  
   Calendar currentCalendar = Calendar.getInstance();
   Calendar cal = Calendar.getInstance();

  int curYear =currentCalendar.get(Calendar.YEAR); 
   int curMonth =currentCalendar.get(Calendar.MONTH)+1;
   int curDate =currentCalendar.get(Calendar.DATE);

  int nTotalDate1 = 0, nTotalDate2 = 0, nDiffOfYear = 0, nDiffOfDay = 0;

  //System.out.println("오늘은 올해의 " +cal.get(Calendar.DAY_OF_YEAR)+"번째 날 입니다");
   //System.out.println("오늘은 이번주의 " +cal.get(Calendar.DAY_OF_WEEK)+"번째 날 입니다");
   //System.out.println("오늘은 올해의 "+cal.get(Calendar.WEEK_OF_YEAR)+"번째 주 입니다");

  if(DdayYear > curYear){  
     for(int i=curYear; i<DdayYear; i++){
       cal.set(i, 12, 0); // 2010, 12, 0
       nDiffOfYear += cal.get(Calendar.DAY_OF_YEAR);
     }
     nTotalDate1 += nDiffOfYear;
   }else if(DdayYear < curYear){
     for(int i=DdayYear; i<curYear; i++){
       cal.set(i, 12, 0);
       nDiffOfYear += cal.get(Calendar.DAY_OF_YEAR);
     }
     nTotalDate2 += nDiffOfYear; 
   }

  cal.set(DdayYear, DdayMonth-1, DdayDate);
   nDiffOfDay = cal.get(Calendar.DAY_OF_YEAR);
   nTotalDate1 += nDiffOfDay;

  cal.set(curYear, curMonth-1, curDate);
   nDiffOfDay = cal.get(Calendar.DAY_OF_YEAR);
   nTotalDate2 += nDiffOfDay;
   
   int Dday = nTotalDate1 - nTotalDate2;
%>
		
		<img src="photo/schedule22.png" id="sched" width="120px" height="80px">
	</div>
	<jsp:include page="home_main.jsp" flush="false" />
	<jsp:include page="footer.html" flush="false" />
</body>
</html>