<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>

<link href="content.css" rel="stylesheet" />
<link href="table.css" rel="stylesheet" />

<%
	String key = request.getParameter("key");
	String search = request.getParameter("search");

	// paginator
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}

	int listSize = 10;
	int currentPage = Integer.parseInt(pageNum);
	int nextPage = currentPage + 1;
	int startRow = (currentPage - 1) * listSize + 1;
	int endRow = currentPage * listSize;
	int lastRow = 0;
	int i = 0;
	int num[] = {0};
	int row = startRow;
%>

<div id="content_div">
	<section id="main_section">
	<img src="photo/게시판.png" height="50px">
	<h1>'<%=search %>' 검색결과입니다.</h1>
	<hr color="#4e4b4b"/><br/><br/>
		<article id="board_ariticle">
			<table >
			<tr>
			<th width="10%">번호</th>
			<th width="60%">제목</th>
			<th width="20%">글쓴이</th>
			<th width="10%">조회수</th>
			</tr>

			<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

	try{
		String url = "jdbc:mysql://203.252.202.75:3306/loveudb";
		String id = "loveudbuser";
		String pw = "loveudbpass";
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,id,pw);
		String sql = "";

		if(key.equals("all")){
			sql = "SELECT count(*) FROM board WHERE title like '%"+search+"%' or userId like '%"+search+"%' or text like '%"+search+"%' order by number DESC";
		}
		else{
			sql = "SELECT count(*) FROM board WHERE "+key+" like '%"+search+"%' order by number DESC";
		}
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		if(rs.next())
			lastRow = rs.getInt(1);
		rs.close();

		// ResultSet에 레코드가 존재할 때
		if(lastRow > 0) {
			if(key.equals("all")){
				sql = "SELECT * FROM board WHERE title like '%"+search+"%' or userId like '%"+search+"%' or text like '%"+search+"%' order by number DESC";
			}
			else{
				sql = "SELECT * FROM board WHERE "+key+" like '%"+search+"%' order by number DESC";
			}
			rs = stmt.executeQuery(sql);
			for(i=1;rs.next(); i++){
				if(i >= startRow && i <=endRow){
%>
					<tr>
					<td width="10%"><%=rs.getString("number") %></td>
					<td width="60%"><a href="board_show.jsp?num=<%=rs.getString("number")%>"><%=rs.getString("title") %></a></td>
					<td width="20%"><%=rs.getString("userid") %></td>
					<td width="10%"><%=rs.getString("readcount") %></td>
					</tr>
<%
					row++;
				}
			}
			rs.close();
			stmt.close();
		}
		else{
%>
			<tr>
			<td colspan="4"><br>등록된 게시물이 없습니다.<br><br></td>
			</tr>
<% 		}
	}catch(SQLException ex){
%>
			<tr>
			<td colspan="4">오류<%=ex %></td>
			</tr>
<%  } %>
			</table>
<%
	if(lastRow > 0) {
		// 페이지가 넘어갈 때 넘겨줄 파라미터
		int setPage = 1;

		// 마지막 페이지의 번호를 저장
		int lastPage = 0;
		if(lastRow % listSize == 0)
			lastPage = lastRow / listSize;
		else
			lastPage = lastRow / listSize + 1;

		if(currentPage > 1) {
%>
		<a href="search.jsp?pageNum=<%=currentPage-1%>&key=<%=key%>&search=<%=search%>&state=board">[이전]</a>
<%
		}
		// 레코드 수에 따라 쪽번호를 매긴다.
		while(setPage <= lastPage) {
%>
				<a href="search.jsp?pageNum=<%=setPage%>&key=<%=key%>&search=<%=search%>&state=board">[<%=setPage%>]</a>
<%
			setPage = setPage + 1;
		}

		// 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.
		if(lastPage > currentPage) {
%>
		<a href="search.jsp?pageNum=<%=currentPage+1%>&key=<%=key%>&search=<%=search%>&state=board">[다음]</a>
<%
		}
	}
%>
	<script>
		function searchfun(){
			var key = document.search_form.key.value;
			var search = document.search_form.search.value;
			urlString = "search.jsp?key="+key+"&search="+search+"&state=board"
			if(search == ""){
				alert("검색어를 입력해 주세요.");
			}
			else{
				location.href=urlString;
			}
		}
	
	</script>
			<div align="right">
			<h1><a href="board.jsp">목록</a><a href="board_write_main.jsp">글쓰기</a></h1>
			</div>
			<br><br>
			<div align ="center">
			<form name="search_form">
			<img src="photo/검색Q.png" width="20px" height="20px">
			<select name="key">
				<option value="all">전체</option>
				<option value="userId">글쓴이</option>
				<option value="title">제목</option>
				<option value="text">내용</option>
			</select>
			<input type="text" size="20" name="search" height="30px"> 
			<img src="photo/검색.png" width="30px" height="20px" onclick="searchfun()">
			</form>
			</div>
		</article>
	</section>
  </div>
