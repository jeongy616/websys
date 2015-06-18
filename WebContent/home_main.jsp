<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.text.*" %>
 <%@ page import = "java.util.*" %>
<script src="jquery-1.11.3.min.js"></script>
<script>
var auto_refresh = setInterval(
		function()
		{
			$('.D_div').load('d_div.jsp');
			},1000);
			
function imgSlideTicker() {

	var self = this;
	this.waitTime = 2000; 
	this.slideSpeed = 2;
	this.contentWidth = 100; 
	this.contentHeight = 90;
	this.imgWin = 'viewImgPop.php';
	this.htmlstr = "";
	this.slideStill=true;
	this.unPauseSlide=1;
	this.tempCount=0;
	this.mode=0;
	this.contentsArray=new Array(); 
	this.reslide;
	this.autoslide = true;
	this.imgOnly = false; 
	this.tmp;
	this.name = "";
	this.simple = 0;

	//this.contentsArray.push('<a><img></a>');

	if (this.slideSpeed%2 && this.slideSpeed > 2)
	{
		this.slideSpeed++;
	}

	this.init = function () {
		if (this.simple == 0)
		{
			document.write('<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">\
									<col width=10><col width=><col width=10><tr>\
									<td align=center valign=middle><span id="'+this.name+'slider1" class="slider" onclick="'+this.name+'.mode=0" title="왼쪽으로 슬라이드">◀</span></td>\
									<td align="center"><div style="height: '+this.contentHeight+'px; width: 100%; position: relative; overflow:hidden; cursor:crosshair" onMouseOver="'+this.name+'.unPauseSlide=0" onMouseOut="'+this.name+'.unPauseSlide=1" id="'+this.name+'slideDiv"></div></td>\
									<td align=center valign=middle><span id="'+this.name+'slider2" class="slider" onclick="'+this.name+'.mode=1" title="오른쪽으로 슬라이드">▶<span></td>\
									</tr><tr valign=middle>\
									<td colspan=3 align=center><table>\
									<tr align=center valign=middle>\
									<td id="'+this.name+'slideMover1" class="slider"></td>\
									<td style="font-size:9pt;"><input onfocus="this.blur();" type="checkbox" id="'+this.name+'autoslideChk" onclick="'+this.name+'.chkAutoslide(this)" checked><label for="'+this.name+'autoslideChk" style="cursor:pointer">자동 슬라이드</label> <input onfocus=this.blur() type=checkbox id="'+this.name+'imgOnlyChk" onclick="'+this.name+'.setImgOnly(this)"><label for="'+this.name+'imgOnlyChk" style="cursor:pointer">이미지만 보기</label></td>\
									<td id="'+this.name+'slideMover2" class="slider">&nbsp;</td>\
									</tr></table></td></tr></table>\
									');
		} else {
			document.write('<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">\
									<tr>\
									<td align="center"><div style="height: '+this.contentHeight+'px; width: 100%; position: relative; overflow:hidden; cursor:crosshair" onMouseOver="'+this.name+'.unPauseSlide=0" onMouseOut="'+this.name+'.unPauseSlide=1" id="'+this.name+'slideDiv"></div></td>\
									</tr></table>\
									');
		}

		var slideDivObj = document.getElementById(this.name+'slideDiv');
		var tmpa = slideDivObj.offsetWidth % this.contentWidth;
		var tmpb = slideDivObj.offsetWidth / this.contentWidth;
		if (tmpa && tmpb > 1)
		{
			var tmpc = Math.floor(tmpb);
			var tmpd = slideDivObj.offsetWidth - (tmpc * this.contentWidth);
			slideDivObj.parentNode.style.paddingLeft = tmpd/2;	 
			slideDivObj.parentNode.style.paddingRight = tmpd/2;
		}

		this.insertContents(); 
		window.setTimeout( function() { self.slideContents();}, self.waitTime); 
	} 

	this.slideContents = function () { 
	if (this.mode == 0) 
	{ 
		if (this.unPauseSlide && this.slideStill) { 
			for (var i=0;i<this.contentsArray.length;i++) { 
				this.tempCount += this.slideSpeed; 
				this.tmp = document.getElementById(this.name+'contentsDiv'+i); 
				this.tmp.style.left = parseInt(this.tmp.style.left)-this.slideSpeed + 'px'; 
				if (parseInt(this.tmp.style.left) <= this.contentWidth*(-1)) { 
					this.tmp.style.left = this.contentWidth*(this.contentsArray.length-1) + 'px'; 
				} 
				if ((this.tempCount>(this.contentWidth-1)*this.contentsArray.length) || this.tempCount == 0) { 
					this.slideStill=false; 
					this.tempCount=0; 
					if (this.autoslide) 
					{ 
						this.reslide = window.setTimeout(function(){self.slideStill=true; self.tempCount=0;}, self.waitTime); 
					} 
				} 
			} 
		} 
	} else if (this.mode == 1) { 
		if (this.unPauseSlide && this.slideStill) { 
			for (var i=0;i<this.contentsArray.length;i++) { 
				this.tempCount -= this.slideSpeed; 
				this.tmp = document.getElementById(this.name+'contentsDiv'+i); 
				if (parseInt(this.tmp.style.left) >= this.contentWidth * (this.contentsArray.length-1)) { 
					this.tmp.style.left = this.contentWidth*(-1) + 'px';  
				} 
				this.tmp.style.left = parseInt(this.tmp.style.left)+this.slideSpeed + 'px';  
				if ((this.tempCount<((this.contentWidth-1)*this.contentsArray.length)*(-1)) || this.tempCount == 0) { 
					this.slideStill=false; 
					this.tempCount=0; 
					if (this.autoslide) 
					{ 
						this.reslide = window.setTimeout(function() { self.slideStill=true; self.tempCount=0;}, self.waitTime); 
					} 
				} 
			} 
		}         
	} 
		window.setTimeout(function () { self.slideContents();}, 1);
	} 

	this.moveContents = function (direction) { 
		if (this.autoslide == false && this.slideStill == false) 
		{ 
			if (direction == "L") 
			{ 
				for (var i=0;i<this.contentsArray.length;i++) { 
					this.tmp = document.getElementById(this.name+'contentsDiv'+i); 
					this.tmp.style.left = parseInt(this.tmp.style.left)-this.contentWidth; 
					if (parseInt(this.tmp.style.left) <= this.contentWidth*(-1)) { 
						this.tmp.style.left = this.contentWidth*(this.contentsArray.length-1); 
					} 
				}                 
			} else if (direction == "R") { 
				for (var i=0;i<this.contentsArray.length;i++) { 
					this.tmp = document.getElementById(this.name+'contentsDiv'+i); 
					if (parseInt(this.tmp.style.left) >= this.contentWidth * (this.contentsArray.length-1)) { 
						this.tmp.style.left = this.contentWidth*(-1); 
					} 
					this.tmp.style.left = parseInt(this.tmp.style.left)+this.contentWidth; 
				}                         
			} 
		} 
	} 

	this.chkAutoslide = function (obj) { 
		if (obj.checked) 
		{ 
			this.autoslide = true; 
			this.slideStill=true; 
			this.tempCount=0; 
			document.getElementById(this.name+'slideMover1').innerHTML = ""; 
			document.getElementById(this.name+'slideMover2').innerHTML = "&nbsp;"; 
			document.getElementById(this.name+'slider1').innerHTML = "◀"; 
			document.getElementById(this.name+'slider2').innerHTML = "▶";                 
		} else { 
			this.autoslide = false; 
			window.clearTimeout(self.reslide); 
			document.getElementById(this.name+'slideMover1').innerHTML = '<span class="slider" onclick="'+this.name+'.moveContents(\'L\')" title="왼쪽으로 이동">◀</span>'; 
			document.getElementById(this.name+'slideMover2').innerHTML = '&nbsp;<span class="slider" onclick="'+this.name+'.moveContents(\'R\')" title="오른쪽으로 이동">▶<span>'; 
			document.getElementById(this.name+'slider1').innerHTML = "&nbsp;"; 
			document.getElementById(this.name+'slider2').innerHTML = "&nbsp;";     
		} 
	} 

	this.insertContents = function () {
		for (var i=0; i<this.contentsArray.length; i++) { 
			this.htmlstr += '<div style="left: '+i*this.contentWidth+'px; width: '+this.contentWidth+'px; position: absolute; " id="'+this.name+'contentsDiv'+i+'">\n'; 
			this.htmlstr += this.contentsArray[i]+'\n'+'</div>\n'; 
		}
		document.getElementById(this.name+'slideDiv').innerHTML = this.htmlstr; 
	}
			
	this.openImgOnly = function (obj) {
		if (this.imgOnly)
		{
			var w = window.open(this.imgWin+"?file="+obj,'img_win','width=300,height=300,top=10,left=10,status=0,resizable=1,scrollbars=0,menubar=0');
			w.focus();
			return false;
		} else {
			return true;
		}
	}

	this.setImgOnly = function (obj) {
		if (obj.checked)
		{
			this.imgOnly = true;
		} else {
			this.imgOnly = false;
		}
	}
}

</script>
<style>
/*본문*/
	.label{
	text-align:right;
		cursor:url(photo/tearpoint.png),pointer;
	}
	#content_div{
	width:70%;
	position: relative;
	text-align: center;
	margin-left:15%;
	margin-top:5px;
	}
	#content > div{
		display:block;
		overflow: hidden;
	}
	#border{
		margin-bottom: 10px;
	}
	#middle{
		float:left;
	}
	#slide{
		width:22%;
		position:absolute;
	}
	#login{
		padding-top:15px;
	}
	#notice{
		position:absolute;
	}
</style>
<script>
setInterval(function () {
	$("li").next().Attr("display","inline");
	}, 2000);
</script>

<div id="content_div">
	<div id="main_div">
		<img src="photo/main2.JPG" width="80%">
	</div>
<%
		Calendar currentCalendar = Calendar.getInstance();
	    Calendar cal1 = Calendar.getInstance();
	    Calendar dday= Calendar.getInstance();
	    
	    int nTotalDate1 = 0, nTotalDate2 = 0, nDiffOfYear = 0, nDiffOfDay = 0;
	    
	    int curYear =currentCalendar.get(Calendar.YEAR);  //2015
	    int curMonth =currentCalendar.get(Calendar.MONTH)+1; //6
	    int curDate =currentCalendar.get(Calendar.DAY_OF_MONTH);//2
	    int curHour = currentCalendar.get(Calendar.HOUR_OF_DAY);//15
	    int curMin = currentCalendar.get(Calendar.MINUTE);
	    int curSec = currentCalendar.get(Calendar.SECOND);
	    
		int DY=2015;
		int DM=8;
		int DD=27;
	    dday.set(DY,DM,DD);// D-day의 날짜를 입력합니다.
		
		int hour= 24-curHour;
		int min = 60-curMin;
		int sec= 60-curSec;
	    
	     cal1.set(DY, DM-1, DD);
	      nDiffOfDay = cal1.get(Calendar.DAY_OF_YEAR);
	      nTotalDate1 += nDiffOfDay;

	     cal1.set(curYear, curMonth-1, curDate);
	      nDiffOfDay = cal1.get(Calendar.DAY_OF_YEAR);
	      nTotalDate2 += nDiffOfDay;
	      
	      int day = nTotalDate1 - nTotalDate2;
	      if(sec != 0){
	    	  min--;
	    	  if(min != 0){
	    		  hour--;
	    	  }
	      }
	      else{
	    	  if(min!=0){
	    		  hour--;
	    	  }
	      }
	      if(hour!=0){
	    	  day--;
	      }
	%>
	<%
		String loginid = (String)session.getAttribute("loginID");
		boolean isLogin = false;
		if(loginid!=null){
			isLogin = true;
		}
		if(isLogin){
	%>
	<div id="login">
	<b><%=loginid%></b> 님 환영합니다.
	<button id="logout" name="logout" onclick="location='logout.jsp'" ><img src="photo/Logoutt.png" width="45px"></button>
	</div>
	<div class="D_div">
		<p class="label">유천이 입대까지 .. <%=day%>일<%=hour%>시간<%=min%>분<%=sec%>초 남음&nbsp&nbsp </p>
	</div>
	<%}else{
	%>
	<div id="login">
	<form name=zb_login method=post action="login_check.jsp" onSubmit="return zb_login_check_submit();">
		<input type="text" size="15" name="inputid"> <input type="password" size="15" name="inputpw">
		<input type="image" src="photo/Login.jpg" border="0" width="45px" >
		<input type="image" src="photo/Join.jpg" border="0" width="45px" >
	</form>
	</div>
	<div class="D_div">
		<p class="label">유천이 입대까지 .. <%=day%>일<%=hour%>시간<%=min%>분<%=sec%>초 남음 &nbsp&nbsp</p>
	</div>

	<%} %>
	<hr id="border">
	<div id="middle">
		<div id="slide">
		<script language="JavaScript"> 
				var slider1 = new imgSlideTicker();
				slider1.name = 'slider1';
				slider1.simple = '1';
				slider1.contentWidth = 206; //각 슬라이드의 넓이 (간격을 위하여 실제 이미지보다 10 정도 크게 설정되어있음, 이미지사이 간격은 10 을 조정하시길)
				slider1.waitTime = 3000; // 잠시멈춤 시간 (2000 = 2초) 
				slider1.slideSpeed = 1; // 슬라이드 움직임 속도 (1 이 가장 느림) 
				slider1.contentHeight = 272; // 테두리를 생각해서 2 를 더함
				slider1.imgWin = 'http://ljoe.kr/bbs/viewImgPop.php';
				slider1.contentsArray.push('<a href="photo/youcheon5.jpg" oncontextmenu="return true;"><img class="sliderIMG" src="photo/youcheon5.jpg" width="200" height="270" border="0" alt="유천1"/></a>');
				slider1.contentsArray.push('<a href="photo/youcheon4.jpg" oncontextmenu="return true;"><img class="sliderIMG" src="photo/youcheon4.jpg" width="200" height="270" border="0" alt="유천2" /></a>');
				slider1.contentsArray.push('<a href="photo/youcheon4.jpg" oncontextmenu="return true;"><img class="sliderIMG" src="photo/images/Copy of testets.jpg" width="200" height="270" border="0" alt="유천2" /></a>');
				slider1.contentsArray.push('<a href="photo/youcheon4.jpg" oncontextmenu="return true;"><img class="sliderIMG" src="photo/images/testtest.jpg" width="200" height="270" border="0" alt="유천2" /></a>');
				slider1.init();
		</script>
		</div>
		<div id="notice" style="overflow:auto;width:100%;height:260;">
<span style="font-size:9pt;color:#000000;line-height:160%;">  <font face=Tahoma>- 가입시 닉네임으로 <b>본명</b>, <b>틴탑 멤버 이름</b>이나, <b>특수문자</b>, <b>자음남발</b> 등은 삼가해주세요.<br />
<font color=cccccc>　Please refrain from nickname TEENTOP member name or such as consonant hard to understand.</font><br />
<br />
- 가입시 닉네임은 띄어쓰기 없이 <b>한글 8자, 영문 12자 이하</b>로 작성해주세요.<br />
<font color=cccccc>　Please create a nickname to Hangul 8 character or alphabet 12 character.</font><br />
<br />
<font color=FF6674 size=5 face=Tahoma><b>━</b></font><br />
<br />
<b>포인트 안내</b> : 데이더방 댓글 작성시 <font color=tomato>+10점</font>, 그 외 모든 글 작성시 <font color=tomato>+5점</font><br />
<br />
Level.7 게시판을 이용하기 위해서는 <b>1123점</b>의 포인트가 필요합니다 :-)<br />
포인트가 쌓이면 자동으로 레벨이 변동되니 따로 문의주지 않으셔도 됩니다.<br />
<br />
<br />
<br />
</span>
		
	</div>

</div>