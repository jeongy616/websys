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
<STYLE type="text/css">

body{font-size: 9pt;}

 td{padding:7px 12px;
 	cursor: pointer;}


a:link{text-decoration:none; color:black}

a:active{text-decoration:none; color:red}

a:visited{text-decoration:none; color:black}

a:hover{text-decoration:none; color:red}

#sche_div{
		position: relative;
		height: 300px;
		width: 270px;
		background: white;
		border:1px solid gray;	
		top: 0px;
		
	}
</STYLE>
<script>
 function test(a){
	var date=a.id;
	$('#sche_div').load('scheduledb.jsp');
	alert(date);
 }


</script>
<body>
<% 

request.setCharacterEncoding("utf-8");

//칼렌더 객체 생성
Calendar cal = Calendar.getInstance();
//오늘 날짜 구하기
int nowYear=cal.get(Calendar.YEAR);
int nowMonth=cal.get(Calendar.MONTH)+1;
//월은 0부터 시작하므로 1월 표시를 위해 1을 더해 줍니다.
int nowDay=cal.get(Calendar.DAY_OF_MONTH);
//클라이언트가 선택하여 넘어온 날짜
String strYear=request.getParameter("year");
String strMonth=request.getParameter("month");

//표시할 달력의 년,월
int year=nowYear;
int month =nowMonth;

if(strYear!=null){// 값이 없으면
	year=Integer.parseInt(strYear);//클라이언트가 선택한 값을 입력
}
if(strMonth!=null){// 값이 없으면
 month=Integer.parseInt(strMonth);//클라이언트가 선택한 값을 입력
}

//전월 이동을 구하기
int preYear=year, preMonth=month-1;
if(preMonth<1){//1월 전월은 작년 12월 이니깐...
 preYear=year-1;
 preMonth=12; 
}
//다음달 구하기
int nextYear=year,nextMonth=month+1;

if(nextMonth>12){//12월 다음달은 내년 1월 이므로...
 nextYear=year+1;
 nextMonth=1;
}
//표시할 달력 세팅
cal.set(year,month-1,1);//년,월,일
int startDay=1;//달의 첫 날
int endDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);

//매년 해당월의 1일 구하기

int week =cal.get(Calendar.DAY_OF_WEEK);

%>


<br/>&nbsp;<br/>

<table align="center" width="270" cellpadding="2" cellspacing="1">

<tr>

<td align="center">

<a href="schedule.jsp?year=<%=preYear %>&month=<%=preMonth %>" id="pre">◀</a>

<b>&nbsp;<%=year %>년&nbsp;&nbsp;<%=month %>월</b>

<a href="schedule.jsp?year=<%=nextYear %>&month=<%=nextMonth %>" id="next">▶</a>

</td>

</tr>

</table>

<!-- 달력표시 -->

<table align="center" width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">

<tr>

<td bgcolor="#e6e4e6" align="center">

 <font color="red">일</font>

</td>

<td bgcolor="#e6e4e6" align="center">월</td>

<td bgcolor="#e6e4e6" align="center">화</td>

<td bgcolor="#e6e4e6" align="center">수</td>

<td bgcolor="#e6e4e6" align="center">목</td>

<td bgcolor="#e6e4e6" align="center">금</td>

<td bgcolor="#e6e4e6" align="center">

 <font color="blue">토</font>

</td>

</tr>

<%

 //한주가 지나면 줄바꿈을 할 것이다.

 int newLine=0;

 out.print("<tr height='20'>");

 for(int i=1;i<week;i++){

  out.print("<td bgcolor='#ffffff'>&nbsp;</td>");

  newLine++;

 }

 

 for(int i=startDay;i<=endDay;i++){//1일 부터 말일까지 반복

 String fontColor=(newLine==0)?"red":(newLine==6)?"blue":"black";

 String bgColor=(nowYear==year)&&(nowMonth==month)&&(nowDay==i)?"#e6e6e6":"#fff";//오늘날짜음영

  

  out.print("<td class='day' onclick='test(this)' align='center' id='"+ year+month+i + "' bgcolor='"+bgColor+"'><font color='"+fontColor+"'>"+i+"</font></td>");

  newLine++;

  if(newLine==7&&i!=endDay){//7일째거나 말일이면 달력 줄바꿈이 일어난다.

   out.print("</tr><tr height='20'>");

   newLine=0;

  }

 }//3항 연산자로 for문으로 요일별 색상을 정한다. 

 

 while(newLine>0&&newLine<7){//마지막날 이후 달력 채우기

  out.print("<td bgcolor='#ffffff'>&nbsp;</td>");

  newLine++;

 }

 out.print("</tr>");

%>
</table>
<div id="sche_div">
</div>
</body>
</html>