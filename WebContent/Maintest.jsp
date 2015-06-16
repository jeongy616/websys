<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
li{list-style:none; }
a{text-decoration:none;}
a:visited{color:black;}
img{border:none;}
button{border:none;
		background-color:#dae3ea;}
body{
	background-image:url('photo/background.jpg');
	background-size:100%;
	background-repeat:no-repeat;
	background-color :white;
	overflow: scroll;
}
*{
margin:0px;
padding:0px;
}
	#header_div{
		width:100%;
	}
	#main_header{
		position:relative;
		overflow:hidden;
	}
	#shortcut{
		right:0;
		padding-right:10%;
		position:absolute;
	}
	#title {
		left:30%;
		padding:5%;
		position:relative;
	}
	#login{
		left:55%;
		position:relative;
		padding-bottom:10px;
		display:inline-block;
	}
	#menu {
		position:relative;
		padding-left:5%;
	}
	#menu > ul {
		position:relative;
		overflow:hidden;
		font-family:'나눔고딕'
	}
	#menu > ul > li{
	float:left;
	font-size:10pt;
	padding-left:5%;
	padding-right:5%;
	}
	#content_div{
	border: 2.5px solid gray;
	width:70%;
	position: relative;
	text-align: center;
	margin-left:15%;
	margin-top:5px;
	background:white;
	padding:1%;
	overflow: visible;
	}
	#content > div{
		display:block;
		border:1px soild balck;
	}
	
	#prev_btn {position:relative;top:0;left:0 ;}
	#next_btn {position:relative;top:0;right:0;margin-left:450px;}
	.btn {width:30px;height:350px;border:0;background-color:#dae3ea;color:white;font-size:30px;}
	#slider {position:absolute;width:600px; height:500px;}
	#slider li {display:none;position:absolute;left:0;top:0}
	#slider img {width:600px; height:auto;}
</style>
<script src="jquery-1.11.3.min.js"></script>
<script>
$(function() {
    var time = 20;
    var idx = idx2 = 0;
    var slide_width = $("#slider").width();
    var slide_count = $("#slider li").size();
    $("#slider li:first").css("display", "block");
 
    $("#prev_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx - 1) % slide_count;
            if(idx2 < 0)
                idx2 = slide_count - 1;
            $("#slider li:hidden").css("left", "-"+slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "+="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", "-"+slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "+="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
 
    $("#next_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx + 1) % slide_count;
            $("#slider li:hidden").css("left", slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "-="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "-="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
});

$('#slider').mouseover(function(){
	$('.btn').css('diplay','inline');
});
$('#slider').mouseout(function(){
	$('.btn').css('diplay','none');
});

</script>
<body>
<div id="header_div">
	<header id="main_header">
		<nav id="shortcut">
			<input type="button" value="facebook">
			<input type="button" value="C-jes">
		</nav>
		<img src="photo/title.png" id="title" height="100px" onclick="location='home.jsp'">
		<div id="login">
			<button id="in" name="in" onclick="location='login.jsp'"><img src="photo/login.png" width="45px" ></button>
			<button id="join" name="join" onclick="location='join.jsp'"><img src="photo/join.png" width="50px" ></button>
		</div>
	</header>
	<nav id="menu">
		<ul >
			<li id="home"><a href="home.jsp">Home</a></li>
			<li id="info"><a href="info.jsp">Info</a>
			<li id="photo"><a href="photo.jsp">Photo</a></li>
			<li id="video"><a href="video.jsp">Video</a></li>
			<li id="board"><a href="board.jsp"> Board </a></li>
			<li id="letter"><a href="letter.jsp"> Letter</a></li>
			<li id="support"><a href="support.jsp">Support</a>
		</ul>
	</nav>
</div> 

<div id="content_div">
	<div id="main_div">
		<ul id="slider">
    		<li><img src="photo/lovelyyou.jpg"></li>
    		<li><img src="photo/youcheon2.jpg"></li>
    		<li><img src="photo/youcheon3.jpg"></li>
		</ul>
	</div>
	<div id="slide_btn">
		<button type="button" id="prev_btn" class="btn"> < </button>
		<button type="button" id="next_btn" class="btn"> > </button>
	</div>
</div>

</body>
</html>