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
			String url = "jdbc:mysql://203.252.202.75:3306/loveudb";
			String id = "loveudbuser";
			String pw = "loveudbpass";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url,id,pw);
			
		
			String textnum = request.getParameter("textnum");
			System.out.println(textnum);
			String userid = request.getParameter("userid");
			String comment = request.getParameter("comment");
			Date d = new Date();
			int number=1;
			
			String sql = "SELECT max(number) FROM comment";
			pstmt = conn.prepareStatement(sql);   
			rs = pstmt.executeQuery();
			if(rs.next()){
				number = rs.getInt(1)+1;
			}

			String sql2 = "INSERT INTO comment values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql2);  
			pstmt.setString(1,userid);
			pstmt.setString(2,d.toString());
			pstmt.setString(3,comment);
			pstmt.setInt(4,number);
			pstmt.setString(5,textnum);
			pstmt.executeUpdate();

			
			out.println("test 테이블에 새로운 레코드를 추가했습니다.");
			int paramnum = 0;
			paramnum = Integer.parseInt(textnum);
			response.sendRedirect("board_show.jsp?num="+paramnum);

		}catch(Exception e){          
			e.printStackTrace();
			out.println("실패 \n"+e);
		}finally{          
			if(rs != null) try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){} 
		}
	%>

</body>
</html>