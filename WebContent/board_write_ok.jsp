<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>                       

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://localhost:3306/websysdb";
			String id = "root";
			String pw = "websys";
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection(url,id,pw);
			
			String title = request.getParameter("title");
			String userid = request.getParameter("");
			//Date date = request.getParameter("inputpw");
			String text = request.getParameter("text");
			int readcount = 0;
			int num = 0;
			System.out.println("input id" + userid);
			
			String sql = "select * from test where userid = ?";
			pstmt = conn.prepareStatement(sql);       
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String testid = rs.getString("userid");
				String testpass = rs.getString("userpw");
				
				if(userpw.equals(testpass)){
					response.sendRedirect("home.jsp");
				
				} else {
	
				}
			}
		}catch(Exception e){          
			e.printStackTrace();
			out.println("test 테이블 호출에 실패했습니다.");
		}finally{          
			if(rs != null) try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){} 
		}
	%>

</body>
</html>