<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Letter Delete</title>
</head>
<body>
<%
	
	String number = request.getParameter("num");
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		String url = "jdbc:mysql://203.252.202.75:3306/loveudb";
		String id = "loveudbuser";
		String pw = "loveudbpass";
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,id,pw);

		String sql = "DELETE FROM letter WHERE number=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,number);
		pstmt.executeUpdate();

		String sql2 = "UPDATE letter SET number=number-? WHERE number>?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1,1);
		pstmt.setString(2,number);
		pstmt.executeUpdate();
	%>
		<script>alert("삭제되었습니다.");
			location.href="letter.jsp";</script>
	<%
	}catch(Exception e){
		out.println("테이블 호출에 실패했습니다."+e);
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>

</body>
</html>