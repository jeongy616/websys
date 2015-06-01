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
		int i=2;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://localhost:3306/websysdb";
			String id = "root";
			String pw = "websys";
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection(url,id,pw);
			
			String userid = request.getParameter("inputid");
			String userpw = request.getParameter("inputpw");
			
			System.out.println("input id" + userid);
			System.out.println("input pw" + userpw);
			
			String sql = "SELECT * FROM members WHERE userId = ?";
			pstmt = conn.prepareStatement(sql);       
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();

			while(rs.next()){
				String testid = rs.getString("userId");
				String testpass = rs.getString("userPwd");
				
				if(userid.equals(testid) && userpw.equals(testpass)){
					i = 0;
					session.setAttribute("loginID", userid);
					%>
					<script>location.href='home.jsp';</script>
					<%
				}
				else if(userid.equals(testid)){
					i=0;%>
					<script>alert("비밀번호가 일치하지 않습니다."); location="login.jsp"</script>
					<%
				}
			}
			if(i==2){
			%>
			<script>alert("아이디가 일치하지 않습니다."); location="login.jsp"</script>
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

</body>
</html>
