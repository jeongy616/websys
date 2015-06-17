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
	<%
		Connection conn = null;                                        
		PreparedStatement pstmt = null;
		
		try{
			String url = "jdbc:mysql://203.252.202.75:3306/loveudb";
			String id = "loveudbuser";
			String pw = "loveudbpass";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url,id,pw);             
			
			String sql = "insert into test values(?,?)";        
			pstmt = conn.prepareStatement(sql);                 
			pstmt.setString(1,"jeongy616");
			pstmt.setString(2,"lovely18");

			pstmt.executeUpdate();                              
			
			out.println("test 테이블에 새로운 레코드를 추가했습니다.");
		
		}catch(Exception e){                                    
			e.printStackTrace();
			out.println("test 테이블에 새로운 레코드 추가에 실패했습니다.");
		}finally{                                               
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}    
			if(conn != null) try{conn.close();}catch(SQLException sqle){}      
		}		
	%>
</body>
</html>