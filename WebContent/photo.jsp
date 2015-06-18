<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.lang.*,java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="background.css" rel="stylesheet" />
<link href="content.css" rel="stylesheet" />
<style>
body{
	background-color : #dae3ea
}

.thumbnail {
	width: 150px;
	height: 150px;
	margin-left: 20px;
	cursor: pointer;
}
</style>
<script src="jquery-1.11.3.min.js"></script>
<script>

	$(function() {
		$('.thumbnail').click(function() {
			var j =this.src;
			var i =window.open("","","width=300,height=400");
			i.document.write("<head><title> View Image</title></head><body onclick='self.close()' style='cursor:hand'> <img src="+j+" width='280'>");
		});
	});
	function upload(){
		window.open('photo_upload.jsp','',"width=550, height=300");
	}
	
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String rank = "master";
	try{
	String loginid = (String)session.getAttribute("loginID");
	String url = "jdbc:mysql://203.252.202.75:3306/loveudb";
	String id = "loveudbuser";
	String pw = "loveudbpass";
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,id,pw);

	String sql = "SELECT * FROM members WHERE rank = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,rank);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		boolean isLogin = false;
		String userid = rs.getString("userid");
		if(userid != null){
			isLogin = true;
			if(isLogin){
				if(loginid.equals(userid)){
					isLogin = true;
	%>
<div id="photo_upload">
	<button id="photo_up" onclick="upload()">올리기</button>
</div>
<div id="content_div">

	<%
				}
			}
		}
	
		File folder = new File(application.getRealPath("/photo/images"));
	    for( File f : folder.listFiles()){
	%>
	    	<img src="/websys/photo/images/<%=f.getName()%>" class='thumbnail'/>  	
	<%
		}
	    }
}catch(Exception ex){
	%>오류<%=ex %>
<%  } %>
	%>
</div>
	<jsp:include page="footer.html" flush="false" />
</body>
</html>