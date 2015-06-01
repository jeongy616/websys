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
		int i = 2;
		boolean j = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://localhost:3306/websysdb";
			String id = "root";
			String pw = "websys";
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection(url,id,pw);
			
			String userid = request.getParameter("id");
	
			String sql = "SELECT * FROM members WHERE userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String testid = rs.getString("userId");
				
				if(userid.equals(testid)){
					i = 0;%>
					<p>중복된 아이디입니다.</p>
					<%
				}
			}
			if(i==2){
			%>
			<p>사용가능한 아이디 입니다.</p>
			<%
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
</table>
</body>
</html>
