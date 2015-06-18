<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.text.*" %>
 <%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
var auto_refresh = setInterval(
		function()
		{
			$('body').load('body');
			},1000);
</script>
<body>
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
		
		int hour= 24-curHour;
		int min = 60-curMin;
		int sec= 60-curSec;
	    
	     cal.set(DY, DM-1, DD);
	      nDiffOfDay = cal.get(Calendar.DAY_OF_YEAR);
	      nTotalDate1 += nDiffOfDay;

	     cal.set(curYear, curMonth-1, curDate);
	      nDiffOfDay = cal.get(Calendar.DAY_OF_YEAR);
	      nTotalDate2 += nDiffOfDay;
	      
	      int day = nTotalDate1 - nTotalDate2;
	      if(sec != 0){
	    	  min--;
	    	  if(min != 0){
	    		  hour--;
	    	  }
	      }
	      else{
	    	  if(min!=0){
	    		  hour--;
	    	  }
	      }
	      if(hour!=0){
	    	  day--;
	      }
	%>
		<p class="label">유천이 입대까지 .. <%=day%>일<%=hour%>시간<%=min%>분<%=sec%>초 남음 &nbsp&nbsp</p>
</body>
</html>