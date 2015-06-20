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
.tbottom{
	padding-top:5px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	
<div id="content_div" >
	<form name=zb_login method=post action="login_check.jsp" onSubmit="return zb_login_check_submit();">
		<table border="0" cellpadding="0" cellspacing="0" width="300">
 			<tr>
  <th width="100">아이디 </th>
  <td><input type="text" size="20" name="inputid"></td>
 </tr>

 <tr>
  <th width="100">비밀번호</th>
  <td><input type="password" size="21" name="inputpw"></td>
 </tr>
 <tr>
  <td colspan="2" class="tbottom">

		<input type="image" src="photo/Login.jpg" border="0" width="45px" >
		<input type="image" src="photo/Join.jpg" border="0" width="45px" >
	</form>
  </td>
 </tr>
 </table>
</div>

	<jsp:include page="footer.html" flush="false" />
</body>
</html>