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
<link href="show.css" rel="stylesheet" />
<style>
</style>
</head>
<script>
$('#text').val().replace(/\n/g, '<br>')
</script>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="content_div">
	<section id="main_section">
	<img src="photo/letter.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
	<article id="letter_ariticle">
<%
	String loginid = (String)session.getAttribute("loginID");
	String number = request.getParameter("num");
	String textnum = number;
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

		String letter = "letter";
		String sql = "SELECT * FROM letter WHERE number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,number);
		rs = pstmt.executeQuery();
		if(rs.next()){
			count = Integer.parseInt(rs.getString("readCount"))+1;
			String userid = rs.getString("userid");
%>
<script>
		function edit(userid){
			
			<%
			if(loginid.equals(userid)){
			%>
				location.href='letter_edit.jsp?num=<%=number%>';
			<%	}
			else{
			%>
				alert("회원님의 게시글이 아닙니다.");
			<%	}%>
		}
		function l_delete(userid){
			<%
			if(loginid.equals(userid)){
			%>
				q=confirm("삭제하시겠습니까?");
				if(q){
					location.href='letter_delete.jsp?num=<%=number%>';
				}
				else{
					alert("삭제가 취소되었습니다.");
				}
			<%	}
			else{
			%>
				alert("회원님의 게시글이 아닙니다.");
			<%	}%>
		}
</script>
			<table>
				<tr>
				<th >작성자</td>
				<td ><%=userid %></td>
				<th >작성일</td>
				<td ><%=rs.getString("date") %></td>
				<th >조회수</td>
				<td ><%=count %></td>
				</tr>
				<tr>
				<th >제목</td>
				<td colspan="5"><%=rs.getString("title") %></td>
				</tr>
				<tr>
				<td colspan="6" id="text"><%=(rs.getString("text")).replace("\r\n", "<br>")%></td>
				</tr>
				<tr>
				<td colspan="6" id="btn">
				<button onclick="location='letter.jsp'"><img src="photo/list.png" width="40px"> </button>
				<button onclick="edit(<%=userid%>)" ><img src="photo/editimg.png" width="40px"> </button>
				<button onclick="l_delete(<%=userid%>)" ><img src="photo/delimg.png" width="40px"> </button>
				</td>
				</tr>
				</table>
<% 
			String sql2 = "UPDATE letter set readCount=? where number=?";
			pstmt = conn.prepareStatement(sql2);       
			pstmt.setInt(1,count);
			pstmt.setString(2,number);
			pstmt.executeUpdate();
		}
	}
	catch(SQLException ex){
		%>오류<%=ex %>
<%  } %>
		
	
  </div>
  </body>