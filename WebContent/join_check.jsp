<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Member</title>
</head>
<body>
<%
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
			
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			String username = request.getParameter("username");
			String usersex = request.getParameter("usersex");
			String usery = request.getParameter("usery");
			String userm = request.getParameter("userm");
			String userd = request.getParameter("userd");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String rank = "mem";
			String email = email1+email2;
			String phone = phone1+phone2+phone3;
			String birth = usery+userm+userd;
			
			out.println(" "+ email +" " + phone +" " + birth+" " +usersex + " ");
			
			String sql = "INSERT INTO members values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);       
			pstmt.setString(1,userid);
			pstmt.setString(2,userpw);
			pstmt.setString(3,email);
			pstmt.setString(4,username);
			pstmt.setString(5,phone);
			pstmt.setString(6,birth);
			pstmt.setString(7,usersex);
			pstmt.setString(8,rank);
			pstmt.executeUpdate();
			
			out.println("test 테이블에 새로운 레코드를 추가했습니다.");
			response.sendRedirect("login.jsp");
			
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