<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="background.css" rel="stylesheet" />
<link href="content.css" rel="stylesheet" />
<style>
th{
	width:20%;
	text-align:center;
	background-color: rgb(102, 153, 255);
}
table{
	width:60%;
	border:0px;
}
</style>
</head>

<body>
	<script>function goback(){history.go(-1);}</script>
	<jsp:include page="header.jsp" flush="false" />
	<div id="content_div">
	<section id="main_section">
	<img src="photo/게시판.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
	<article id="board_ariticle">
<%
	String loginid = (String)session.getAttribute("loginID");
	String number = request.getParameter("num");
	request.setCharacterEncoding("UTF-8");
	int count;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String url = "jdbc:mysql://203.252.202.75:3306/loveudb";
		String id = "loveudbuser";
		String pw = "loveudbpass";
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,id,pw);

		String sql = "SELECT * FROM board WHERE number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,number);
		rs = pstmt.executeQuery();
		if(rs.next()){
			count = Integer.parseInt(rs.getString("readCount"))+1;
			String userid = rs.getString("userid");
%><center>
		<form method="post" action="board_edit_ok.jsp?num=<%=number%>">
			<table border="1" bgcolor="white">
			<tr>
			<th >작성자</th>
			<td ><input type="text" name="userid" id="userid" size="100" value="<%=rs.getString("userid") %>" disabled="disabled"></td>
			</tr>
			<tr>
			<th >제목</th>
			<td ><input type="text" name="title" size="70" value="<%=rs.getString("title") %>"></td>
			</tr>
			<tr>
			<td colspan="2">
			<textarea rows="20" name="text" cols="110"><%=(rs.getString("text")).replace("\r\n", "<br>")%></textarea></td>
			</tr>
			<tr>
			<td colspan="2" align="right">
			<input type="submit" value="수정완료">
			<input type="button" value="수정취소" onclick="goback()">
			</td>
			</tr>
			</table>
		</form></center>
<%
		}
	}catch(SQLException ex){
		%>오류<%=ex %>
<%  } %>
		</article>
	</section>
  </div>
  </body>