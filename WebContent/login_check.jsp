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
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://localhost:3306/web01";
			String id = "root";
			String pw = "websys";
			Class.forName("com.mysql.jdbc.Driver"); 
			conn=DriverManager.getConnection(url,id,pw);
			
			String userid = request.getParameter("inputid");
			String userpw = request.getParameter("inputpw");
			
			System.out.println("input id" + userid);
			System.out.println("input pw" + userpw);
			
			String sql = "select * from test where userid = ?";
			pstmt = conn.prepareStatement(sql);       
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String testid = rs.getString("userid");
				String testpass = rs.getString("userpw");
				
				if(userpw.equals(testpass)){
					%>
					<tr><td width="100"><%=testid%></td>
					<td width="100"><%=testpass%></td></tr>
					<p> 맞음.. </p>
		<%
				} else {
					%>
					<script>alert("아이디나 비밀번호가 틀렸습니다."); location="login.jsp"</script>
		<%
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
