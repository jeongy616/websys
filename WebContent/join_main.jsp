<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="join.js"></script>
    <link href="content.css" rel="stylesheet" />
	  <style>
 table{font-family:"굴림" font-size:12px;}
 th{background:#ccc; text-align:left; padding:7px 10px; border-bottom:1px solid #919191; border-right:1px solid #919191; border-left:1px solid #919191; border-top:1px solid #919191;}
 td{padding:7px 10px; border-bottom:1px solid #919191;border-right:1px solid #919191;border-top:1px solid #919191;}
 img{vertical-align:middle;}
 select{}
 input{}
 .top{font-weight:bold; padding:5px 0px; border:0px; border-bottom:1px solid #919191; }
 .bottom{text-align:center; border:0px} 
</style>
<div id="schedule_div">
	<img src="photo/schedule1.png" id="sched" width="120px" height="80px" onclick="location='schedule.html'">
</div>
<div id="content_div">
	<section id="main_section">
		<div id="join_div">
			<article id="join_article">
			<form onsubmit="return sub()" name="join_form" action="join_check.jsp" method="post">
<table border="0" cellpadding="0" cellspacing="0" width="900">
 <tr>
  <th width="200">아이디 </th>
  <td><input type="text" size="20" name="userid"> <input type="button" value="중복확인" onclick="idcheck()">*4~12자의 영문과 숫자의 조합</td>
 </tr>

 <tr>
  <th width="200">비밀번호</th>
  <td><input type="password" size="21" name="userpw" id="userpw">*4~12자의 영문과 숫자의 조합</td>
 </tr>

 <tr>
  <th width="200">비밀번호확인</th>
  <td><input type="password" size="21" name="userpwcheck" id="userpwcheck" onblur="pwcheck()"></td>
 </tr>

 <tr>
  <th width="200">이름 </th>
  <td><input type="text" name="username"></td>
 </tr>

 <tr>
  <th width="200">성별</th>
  <td>
   <select>
    <option>여자</option>
    <option>남자</option>
   </select>
  </td>
 </tr>

 <tr>
  <th width="200">생년월일</th>
  <td><input type="text" size="6">년<input type="text" size="4">월<input type="text" size="4">일
 </tr>

 <tr>
  <th width="200">전화번호</th>
  <td><input type="text" size="6"> - <input type="text" size="6"> - <input type="text" size="6"></td>
 </tr>

 <tr>
  <th width="200">이메일 </th>
  <td><input type="text" size="12"> @ <input type="text" size="20">
  *이메일로 다양한 서비스를 받아보시겠습니까? <input type="radio" checked>예<input type="radio">아니오
  </td>
 </tr>

<tr>
	<th>보안문자</th><td><input type="text" size="6" id="usersec1" disabled="disabled" value="000000">
	<input type="text" size="6" id="usersec2" ></td>
</tr>


 <tr>
  <td colspan="2" class="bottom">
  <input type="submit" value="회원가입"><input type="reset" value="취소하기">
  </td>
 </tr>

</table>

</form>
</article>
</div>
</section>
</div>

	  