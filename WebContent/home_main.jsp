<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script>
$(function() {
    var time = 20;
    var idx = idx2 = 0;
    var slide_width = $("#slider").width();
    var slide_count = $("#slider li").size();
    $("#slider li:first").css("display", "block");
    if(slide_count > 1)
        $(".btn").css("display", "inline");
 
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
</script>
<style>
/*본문*/
	#schedule_div{
		padding:350px 0px 0px 0px;
		float:left;
	}
	#content_div {
		padding:50px;
		padding-left:150px;
	}
	#main_section {
		position:relative;
		overflow:hidden;
		padding-left:150px;
	}
	#main_section > #photo_div {
		float:left;
		padding: 20px 20px 0px 20px;
		width:700px;
	}
	#main_section > div > article{
		width:100%;
	}
	#main_section > div > article > img {
		
	}
	

#prev_btn {position:relative;top:0;left:0 ;}
#next_btn {position:relative;top:0;right:0;margin-left:400px;}
.btn {width:30px;height:350px;border:0;background-color:#dae3ea;color:white;font-size:30px;}
 
#slider {position:absolute;margin:0;padding:0;list-style:none;width:450px;height:500px;overflow:hidden}
#slider li {display:none;position:absolute;left:0;top:0}
#slider img {width:450px;height:350px}
</style>

<div id="schedule_div">
	<img src="photo/schedule1.png" id="sched" width="120px" height="80px" onclick="location='schedule.html'">
</div>
<div id="content_div">
	<section id="main_section">
		<div id="photo_div">
			<article id="photo_article">
				<ul id="slider">
    				<li><img src="photo/youcheon3.jpg"></li>
    				<li><img src="photo/youcheon2.jpg"></li>
    				<li><img src="photo/youcheon3.jpg"></li>
				</ul>
				<div id="slide_btn">
				<button type="button" id="prev_btn" class="btn"> < </button>
				<button type="button" id="next_btn" class="btn"> > </button>
				</div>
			</article>
		</div>
		<div id="news_div">
			<article id="news_article">
				<img src="" width="100%">
			</article>
		</div>
	</section>
</div><!--여기까지 section-->