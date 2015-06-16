<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>                       
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/websysdb","root","websys");
	
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		Date d = new Date();
		String number = request.getParameter("num");

		String sql2 = "UPDATE letter SET title=?,date=?,text=? WHERE number=?";
		pstmt = conn.prepareStatement(sql2);       
		pstmt.setString(1,title);
		pstmt.setString(2,d.toString());
		pstmt.setString(3,text);
		pstmt.setString(4,number);
		pstmt.executeUpdate();
	%>	
		<script>alert("수정완료 되었습니다.");
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