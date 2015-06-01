<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
li{list-style:none; }
a{text-decoration:none;}
img{border:none;
    padding:0px;
}
	#header_div >#main_header{
		position:relative
		overflow:hidden;
		}
	#main_header > #shortcut{
		right:0;
		padding-right:100px;
		position:absolute;
	}
	#main_header > #title {
		left:30%;
		padding:30px;
		position:relative;
	}
	#main_header > #login{
		left:60%;
		position:relative;
		padding-bottom:20px;
		display:inline-block;
	}
	#main_header > #login > button {
		border:none;
	}
	
	/*메뉴*/
	#menu {
		position:relative;
		background-color :rgba(0,0,0,0.5);
	}
	#menu > ul {
		position:relative;
		overflow:hidden;
		font-family:'맑은 고딕'
	}
	#menu > ul > li{float:left;}
	#menu > ul > li > ul {visibility:hidden;}
	#menu > ul > li > ul > li {float:left;padding:0px 0px 10px 0px;}
	#menu > ul > li > ul > li > a{
		color : white;
		font-size:15px;
		padding:0px 25px 20px 25px;
	}
	#menu > ul > li:hover > ul{visibility:visible;}
	#menu > ul > li > a{
        color:white;
		font-size: 20;
        display:block;
        padding:10px 70px 10px 70px;
    }
</style>
 <div id="header_div">
	<header id="main_header">
		<nav id="shortcut">
			<input type="button" value="페이스북">
			<input type="button" value="트위터">
			<input type="button" value="엔터테인먼트">
		</nav>
		<img src="photo/사랑해유.png" id="title" height="100px" onclick="location='home.jsp'">
		<div id="login">
			<button id="in" name="in" onclick="location='login.jsp'"><img src="photo/로그인.png" width="45px" ></button> 
			<button id="join" onclick="location='join.jsp'"/><img src="photo/회원가입.png" width="50px"></button>
		</div>
	</header>
	<nav id="menu">
		<ul >
			<li id="info"><a href="info.jsp">Info</a>
			<li id="data"><a href="#">Data</a>
				<ul class="sub">
					<li><a href="photo.jsp">Photo</a></li>
					<li><a href="video.jsp">Video</a></li>
				</ul>
			<li><a href="#">Community</a>
				<ul class="sub">
					<li><a href="board.jsp"> Board </a></li>
					<li><a href="letter.jsp"> Letter   </a></li>
				</ul>
			<li id="support"><a href="support.jsp">Support</a>
		</ul>
	</nav><!--여기까지가 메뉴-->
</div> <!--여기까지가 Header-->
