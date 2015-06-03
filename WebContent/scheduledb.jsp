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
Statement stmt = null;
ResultSet rs = null;

try{
	String url = "jdbc:mysql://localhost:3306/websysdb";
	String id = "root";
	String pw = "websys";
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,id,pw);

	String sql = "SELECT * FROM schedule";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	String date = request.getParameter("date");
	
		if(rs.next()){
			String testdate = rs.getString("when");
			if(date.equals(testdate)){
%>
					<table>
					<tr>
					<td width="10%"><%=testdate%></td>
					<td width="10%"><%=rs.getString("title")%><br /><%=rs.getString("where")%></td>
					</tr>
					</table>
<%	
			}
		}
		%><p>?</p>
		<%
			
		rs.close();
		stmt.close();
	}catch(SQLException ex){
		System.out.println("실패");
}
%>
</body>
</html>