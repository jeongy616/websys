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
body{
	background-color : #dae3ea
}</style>
</head>
<body>
	<jsp:include page="header_login.jsp" flush="false" />
	<div id="content_div">
	<section id="main_section">
	<img src="photo/letter.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
	<article id="letter_ariticle">
<%
	String number = request.getParameter("num");
	int count;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String url = "jdbc:mysql://localhost:3306/websysdb";
		String id = "root";
		String pw = "websys";
		Class.forName("com.mysql.jdbc.Driver"); 
		conn=DriverManager.getConnection(url,id,pw);

		String sql = "SELECT * FROM letter WHERE number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,number);
		rs = pstmt.executeQuery();
		if(rs.next()){
			count = Integer.parseInt(rs.getString("readCount"))+1;
%>
			<table border="1" align="center" width="100%">
				<tr>
				<td >제목</td>
				<td ><%=rs.getString("title") %></td>
				</tr>
				<tr>
				<td >작성자</td>
				<td ><%=rs.getString("userid") %></td>
				</tr>
				<tr>
				<td >작성일</td>
				<td ><%=rs.getString("date") %></td>
				</tr>
				<tr>
				<td >조회수</td>
				<td ><%=count %></td>
				</tr>
				<tr>
				<td colspan="2"><%=rs.getString("text") %></td>
				</tr>
				<tr>
				<td colspan="2" align="right">
				<a href="letter.jsp">목록</a>
				<input type="button" value="수정"><input type="button" value="삭제"></td>
				</tr>
			</table>
<% 
			String sql2 = "UPDATE letter set readCount=? where number=?";
			pstmt = conn.prepareStatement(sql2);       
			pstmt.setInt(1,count);
			pstmt.setString(2,number);
			pstmt.executeUpdate();
		}
	}catch(SQLException ex){
		%>오류<%=ex %>
<%  } %>
		</article>
	</section>
  </div>
  </body>