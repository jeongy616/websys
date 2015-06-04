<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");
Connection conn = null;            
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String url = "jdbc:mysql://localhost:3306/websysdb";
	String id = "root";
	String pw = "websys";
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,id,pw);

	String date = request.getParameter("date");
	
	String sql = "SELECT * FROM schedule WHERE date=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,date);
	rs = pstmt.executeQuery();
	
		while(rs.next()){
%>
					<table>
					<tr>
					<td width="10%"><%=rs.getString("title")%><br /><%=rs.getString("location")%></td>
					</tr>
					</table>
<%
		}
			%>
			<%
		rs.close();
		pstmt.close();
	}catch(SQLException ex){
		System.out.println(ex.getStackTrace().toString());
		System.out.println("실패");
}
%>
</body>
</html>