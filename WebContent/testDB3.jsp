<HTML>
 <HEAD><TITLE> 마우스 이벤트(Layer)를 이용한 활용예제 </TITLE>
  <script>
  function View(brdContent)
  {
 // 글내용을 보여줄 레이어 위치 지정
 document.getElementById('content').style.left=event.x+10+document.body.scrollLeft
 document.getElementById('content').style.top=event.y+10+document.body.scrollTop
   //레이어 표시하기
   document.getElementById('content').style.visibility="visible"
  // 레이어 안에 글내용 채우기
    document.getElementById('content').innerText=brdContent
  }
  function hide()
  {
   // 레이어 표시하기
    document.getElementById('content').style.visibility="hidden" 
 }
/*
   1. 레이어 객체 만들기
  ① <태그명 id="이름"></태그명>
     ② <태그명 id="이름">   ---- innerText,innerHTML은 사용안됨
   2. 레이어 객체 접근
  ① document.all.레이어 이름
     (document.all은 생략가능)
  
  ② document.all['레이어이름']
     ===>IE에서만 지원(인터넷 익스플로어)
     
  ③ document.layers['레이어이름']
     ===>NE에서만 지원(네스케이프)
     ④ document.getElementById('레이어이름')
  ===>IE,NE모두 지원
-----------------------------------------------------------------------------------------------------------------------------------
   ※ 레이어 속성 활용
 ① 레이어객체.innerText="문자열"
     : 쌍이 존재하는 태그를 사용한 레이어 안에 문자열 삽입
     : <태그명 id="레이어이름">문자열</태그명>
 
 ② 레이어객체.innerHTML="태그문자열"
  : 쌍이 존재하는 태그를 사용한 레이어 안에 태그문자열 삽입
     : <태그명 id="레이어이름">태그가 포함된 문자열</태그명>

*/
  </script>
 </HEAD>
 <BODY>
  <center>
  <div id="content" style="border:1px solid red; font-size:11px; visibility:hidden; background-color='#FFFFCC'" ></div>
  <table width=650 border=1>
   <tr>
  <th>글번호</th>
  <th>글제목</th>
  <th>작성날짜</th>
  <th>작성자</th>
   </tr>
   <tr onmouseover="this.style.backgroundColor='#FFCCCC'" onmouseout="this.style.backgroundColor=''">
   <td align=center>1</td>
   <td style="padding-left:13px;"><A HREF="#" onmouseover="View('30일동안 체계적으로 학습할 수 있다.')" 
   onmousemove="View('30일동안 체계적으로 학습할 수 있다.')"onmouseout="hide()">HTML과 자바스크립트 30일 완성</A></td>
   <!-- 셀테두리와 내용사이의 왼쪽간격이 13px; -->
   <td align=center>2007-04-09</td>
   <td align=center>신문섭</td>
   </tr>
   <tr onmouseover="this.style.backgroundColor='#FFCCCC'" onmouseout="this.style.backgroundColor=''">
   <td align=center>2</td>
   <td style="padding-left:13px;"><A HREF="#" onmouseover="View('초보자도 쉽게 따라 할 수 있는 실무예제 중심으로 구성되었다.')" onmousemove="View('초보자도 쉽게 따라 할 수 있는 실무예제 중심으로 구성되었다.')" onmouseout="hide()">Contact ASP3.0</A></td>
   <!-- 셀테두리와 내용사이의 왼쪽간격이 13px; -->
   <td align=center>2007-04-18</td>
   <td align=center>정일섭</td>
   </tr>
 
  </table>
  </center>
 </BODY>
</HTML>
 