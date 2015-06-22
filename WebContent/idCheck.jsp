<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>                       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID Check</title>
</head>
					<script>
					  function inputClose(){
						  var test = document.getElementById("child").value;
					     opener.document.all.checkid.value = test;           
					     self.close();
					  }
					     function inputClose2(){
					    	 var test = document.getElementById("child2").value;
						     opener.document.all.checkid.value = test;           
						     self.close();
						  }
					</script>
<body>
<table>
	<%
		int i = 2;
		boolean j = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String url = "jdbc:mysql://203.252.202.75:3306/loveudb";
			String id = "loveudbuser";
			String pw = "loveudbpass";
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
					  <input type="hidden" value="1" id="child"></td>
					<input type="button" value="close" onclick="inputClose()" />
					<%
					
				}
			}
			if(i==2){
			%>
			<p>사용가능한 아이디 입니다.</p>
			  <input type="hidden" value="2" id="child2"></td>
			<input type="button" value="close" onclick="inputClose2()" />
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
