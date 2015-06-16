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
body{
	background-color : #dae3ea
}</style>
</head>

<body>
	<jsp:include page="header_login.jsp" flush="false" />
	<div id="content_div">
	<section id="main_section">
	<img src="photo/게시판.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
	<article id="board_ariticle">
<%
	String loginid = (String)session.getAttribute("loginID");
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

		String sql = "SELECT * FROM board WHERE number = ?";
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
				location.href='board_edit.jsp?num=<%=number%>';
			<%	}
			else{
			%>
				alert("회원님의 게시글이 아닙니다.");
			<%	}%>
		}
		function b_delete(userid){
			<%
			if(loginid.equals(userid)){
			%>
				q=confirm("삭제하시겠습니까?");
				if(q){
					location.href='board_delete.jsp?num=<%=number%>';
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
				<td ><%=rs.getString("userid") %></td>
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
				<a href="board.jsp">목록</a>
				<input type="button" value="수정" onclick="edit(<%=userid%>)"><input type="button" value="삭제" onclick="b_delete(<%=userid%>)">
				</td>
				</tr>
				</table>
<%
		String sql2 = "UPDATE board set readCount=? where number=?";
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