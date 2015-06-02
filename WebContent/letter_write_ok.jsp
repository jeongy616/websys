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
			String userid = request.getParameter("userid");
			String text = request.getParameter("text");
			Date d = new Date();
			int number=1;
			
			String sql = "SELECT max(number) FROM letter";
			pstmt = conn.prepareStatement(sql);   
			rs = pstmt.executeQuery();
			if(rs.next()){
				number = rs.getInt(1)+1;
			}

		
			String sql2 = "INSERT INTO letter values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql2);       
			pstmt.setString(1,title);
			pstmt.setString(2,userid);
			pstmt.setString(3,d.toString());
			pstmt.setInt(4,0);
			pstmt.setString(5,text);
			pstmt.setInt(6,number);
			pstmt.executeUpdate();
			
			out.println("test 테이블에 새로운 레코드를 추가했습니다.");
			response.sendRedirect("letter.jsp");

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