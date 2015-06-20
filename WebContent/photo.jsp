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
.thumbnail {
	width: 150px;
	height: 150px;
	margin-left: 20px;
	cursor: pointer;
}
.photo_upload{
	padding-bottom: 15px;
}
#photo_up_no{
	cursor: url(photo/youpointer.png) 2 2, pointer;
}
</style>
<script src="jquery-1.11.3.min.js"></script>
<script>

	$(function() {
		$('.thumbnail').click(function() {
			var j =this.src;
			var size = new Image();
			size.src = j;
			var imgwidth = size.width+20;
			var imgheight = size.height+20;
			var i =window.open("","","width="+imgwidth+",height="+imgheight);
			i.document.write("<head><title>"+imgwidth+"View Image</title></head><body onclick='self.close()' style='cursor:hand'> <img src="+j+">");
		});
	});
	function upload(){
		window.open('photo_upload.jsp','',"width=550, height=300");
	}
	
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="content_div">
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String rank = "master";
	try{
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
		String loginid = (String)session.getAttribute("loginID");
		String userid = rs.getString("userid");
		if(loginid!=null){
			if(userid != null){
				if(loginid.equals(userid)){
	%>

	<div class="photo_upload">
		<button id="photo_up" onclick="upload()" background-color="white"><img src="photo/Upload.jpg" width="70px" ></button>
	</div><br>
	<%
				}
				else{
					%>
					<div class="photo_upload">
						<button id="photo_up_no" onclick="upload()" disabled="disabled"><img src="photo/Upload.jpg"width="70px"></button>
					</div>
					<%}
			}
		}
		else{
		%>
		<div class="photo_upload">
			<button id="photo_up_no" onclick="upload()" disabled="disabled"><img src="photo/Upload.jpg"width="70px"></button>
		</div>
		<%}
	}
		File folder = new File(application.getRealPath("/photo/images"));
	    for( File f : folder.listFiles()){
	%>
	    <img src="/websys/photo/images/<%=f.getName()%>" class='thumbnail'/>  	
	<%
		}
}catch(Exception ex){
	%>오류<%=ex %>
<%  } %>
</div>
	<jsp:include page="footer.html" flush="false" />
</body>
</html>