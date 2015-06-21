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
</head>
<style>
.com_btn{
 background-color:#FFADFF;
 color:white;
 font-size:13px;
}
</style>
<script>
$('#text').val().replace(/\n/g, '<br>')
</script>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="content_div">

	<img src="photo/게시판.png" height="50px">
	<hr color="#4e4b4b"/><br/><br/>
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
		
		String board = "board";
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
		function b_delete(userid){alert("userid");
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
				<th >작성자</th>
				<td ><%=userid%></td>
				<th >작성일</th>
				<td ><%=rs.getString("date") %></td>
				<th >조회수</th>
				<td ><%=count %></td>
				</tr>
				<tr>
				<th >제목</th>
				<td colspan="5"><%=rs.getString("title") %></td>
				</tr>
				<tr>
				<td colspan="6" id="text"><%=(rs.getString("text")).replace("\r\n", "<br>")%></td>
				</tr>
				<tr>
				<td colspan="6" id="btn">
				<button onclick="location='board.jsp'"><img src="photo/list.png" width="40px"> </button>
				<button onclick="edit(<%=userid%>)"><img src="photo/editimg.png" width="40px"> </button>
				<button onclick="b_delete(<%=userid%>)" ><img src="photo/delimg.png" width="40px"> </button>
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
		%><center>
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
		<input type="hidden" name="bole" value="<%=board%>" >
		<input type="submit" value=" O " class="com_btn">
		</td>
		</tr>
		</table>
		</form></center>
		<% 
		String sql3 = "SELECT * FROM comment WHERE textnum = ?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1,textnum);
		rs = pstmt.executeQuery();

		while(rs.next()){
			String userid = rs.getString("userid");
			String comnumber = rs.getString("number");
			%>
			<script>
			function com_del(userid){
				<%
				if(loginid.equals(userid)){
				%>
					q=confirm("삭제하시겠습니까?");
					if(q){
						location.href='comment_del.jsp?number=<%=comnumber%>&bole=<%=board%>'
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
				<input type="button" value=" X " onclick="com_del(<%=rs.getString("userid")%>)" class="com_btn">
				</td>
				</tr>
				</table></center>
				<%
		}
	}catch(SQLException ex){
		%>오류<%=ex %>
<%  } %>

  </div>
  </body>