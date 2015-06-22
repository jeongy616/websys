<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Letter Show</title>
<link href="background.css" rel="stylesheet" />
<link href="content.css" rel="stylesheet" />
<link href="show.css" rel="stylesheet" />
<style>
.com_btn{
 background-color:#FFADFF;
 color:white;
 font-size:13px;
}
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

		String sql4 = "SELECT rank FROM members WHERE userId = ?";
		pstmt = conn.prepareStatement(sql4);
		pstmt.setString(1,loginid);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String userrank = rs.getString("rank");
			String rank = "master";

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
		function edit(){
			
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
		function l_delete(){
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
			<%}
			else if(userrank.equals(rank)){
				%>
					q=confirm("관리자권한으로 삭제하시겠습니까?");
					if(q){
						location.href='letter_delete.jsp?num=<%=number%>';
					}
					else{
						alert("삭제가 취소되었습니다.");
					}
			<%}
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
				<button onclick="edit()" ><img src="photo/editimg.png" width="40px"> </button>
				<button onclick="l_delete()" ><img src="photo/delimg.png" width="40px"> </button>
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
%>		<center>
		<form name="com_form" action="comment_ok.jsp?num=<%=textnum%>">
		<table  class="com" style="width:80%;">
		<tr class="com">
		<th>코멘트를 작성해주세요.</th>
		</tr>
		<tr class="com">
		<td class="com"><textarea rows="5" name="comment" cols="140"></textarea></td>
		</tr>
		<tr class="com">
		<td class="com">
		<input type="hidden" name="userid" value="<%=loginid%>" >
		<input type="hidden" name="textnum" value="<%=textnum %>" >
		<input type="hidden" name="bole" value="letter" >
		<input type="submit" value=" O " class="com_btn">
		</td>
		</tr>
		</table>
		</form></center>
<%
	String sql3 = "SELECT * FROM comment2 WHERE textnum = ?";
	pstmt = conn.prepareStatement(sql3);
	pstmt.setString(1,textnum);
	rs = pstmt.executeQuery();

	while(rs.next()){
		String couserid = rs.getString("userid");
		String comnumber = rs.getString("number");
		%>
		<script>
		function com_del(){
			<%
			if(loginid.equals(couserid)){
			%>
				q=confirm("삭제하시겠습니까?");
				if(q){
					location.href='comment_del.jsp?number=<%=comnumber%>&bole=letter'
				}
				else{
					alert("삭제가 취소되었습니다.");
				}
			<%	}
			else{
			%>
				alert("회원님의 댓글이 아닙니다.");
			<%	}%>
		}
		</script><center>
		<table style="width:80%;">
			<tr>
			<th width="20%">작성자</td>
			<td width="30%"><%=rs.getString("userid")%></td>
			<th width="20%">작성일</td>
			<td width="30%"><%=rs.getString("date") %></td>
			</tr>
			<tr>
			<td colspan="4" id="comment"><%=(rs.getString("comment")).replace("\r\n", "<br>")%></td>
			</tr>
			<tr>
			<td colspan="4" id="btn">
			<input type="button" value=" X " onclick="com_del()" class="com_btn">
			</td>
			</tr>
			</table></center>
				<%
		}	}
	}catch(SQLException ex){
		%>오류<%=ex %>
<%  } %>

  </div>
  </body>