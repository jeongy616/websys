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
a:visited{color:white;}
img{border:none;}
button{border:none;
		background-color:#FFB5DA;}
body{
	background-image:url('photo/backpink.jpg');
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
		left:37%;
		padding:2%;
		position:relative;
	}
	#login{
		right:30%;
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
	}
	#menu > ul > li{
	float:left;
	font-family:'나눔고딕';
	font-color:white;
	font-size:12pt;
	padding-left:6%;
	padding-right:6%;
	padding-top:10px;
	padding-bottom:10px;
	margin-bottom:10px;
	background-color:#d4dada;
	}
	#content_div{
	width:70%;
	position: relative;
	text-align: center;
	margin-left:15%;
	margin-top:5px;
	background:white;
	}
	#content > div{
		display:block;
		overflow: hidden;
	}
	#border{
		margin-bottom: 10px;
	}
	#slide {position:absolute;width:200px; height:300px;overflow:hidden;}
	#slider li {display:none;position:absolute;left:0;top:0}
	#slider img {width:auto; height:300px; }
</style>
<script src="jquery-1.11.3.min.js"></script>
<script>
$(function () {

    /* SET PARAMETERS */
    var change_img_time = 5000; 
    var transition_speed= 100;

    var simple_slideshow=$("#Slider"),
        listItems=simple_slideshow.children('li'),
        listLen=listItems.length,
        i= 0,

        changeList = function () {

            listItems.eq(i).fadeOut(transition_speed, function () {
                i += 1;
                if(i ==listLen) {
                    i = 0;
                }
                listItems.eq(i).fadeIn(transition_speed);
            });

        };

    listItems.not(':first').hide();
    setInterval(changeList, change_img_time);

});
</script>
<body>
<div id="header_div">
	<header id="main_header">
		<img src="photo/titlee.png" id="title" height="110px" onclick="location='home.jsp'">
	</header>
	<nav id="menu">
		<ul >
			<li id="home"><a href="home.jsp">Home</a></li>
			<li id="info"><a href="info.jsp">Info</a>
			<li id="photo"><a href="photo.jsp">Photo</a></li>
			<li id="board"><a href="board.jsp"> Board </a></li>
			<li id="letter"><a href="letter.jsp"> Letter</a></li>
			<li id="support"><a href="support.jsp">Support</a>
		</ul>
	</nav>
</div>


</body>
</html>