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
	
	/*�޴�*/
	#menu {
		position:relative;
		background-color :rgba(0,0,0,0.5);
	}
	#menu > ul {
		position:relative;
		overflow:hidden;
		font-family:'���� ����'
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
			<input type="button" value="���̽���">
			<input type="button" value="Ʈ����">
			<input type="button" value="�������θ�Ʈ">
		</nav>
		<img src="photo/�������.png" id="title" height="100px" onclick="location='home.jsp'">
		<div id="login">
			<button id="in" name="in" onclick="location='login.jsp'"><img src="photo/�α���.png" width="45px" ></button> 
			<button id="join" onclick="location='join.jsp'"/><img src="photo/ȸ������.png" width="50px"></button>
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
			<li><a href="#">Etc</a>
				<ul class="sub">
					<li><a href="schedule.jsp">Schedule</a></li>
					<li><a href="shortcut.jsp">Shortcut</a></li>
				</ul>
		</ul>
	</nav><!--��������� �޴�-->
</div> <!--��������� Header-->