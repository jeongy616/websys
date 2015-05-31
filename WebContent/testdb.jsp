<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>                       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<%
	Connection conn = null;                     
	PreparedStatement pstmt = null;
	ResultSet rs = null;	

	String url = "jdbc:mysql://localhost:3306/web01";       
	String id = "root";                                      
	String pw = "websys";     
	Class.forName("com.mysql.jdbc.Driver");            
	conn=DriverManager.getConnection(url,id,pw); 

	Statement stmt = conn.createStatement();
	rs = stmt.executeQuery("SELECT * FROM test");
	
	
	while(rs.next()){
		String testid=rs.getString("userid");
		String testpw=rs.getString("userpw");
		%>
		<tr><td width="100"><%=testid%></td>
		<td width="100"><%=testpw%></td></tr>
		<%
	}
	
%>
</table>
</body>
</html>