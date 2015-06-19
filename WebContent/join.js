	var secchk=0;
	window.onload = function sec(){//보안번호 확인
		  var sec = Math.ceil(Math.random()*1000000);
		  var out=document.getElementById("usersec1");
		  out.value = sec;
	  }
	  function secCheck(){
		  var sec1 = document.join_form.usersec1.value;
		  var sec2 = document.join_form.usersec2.value;
		  
		  if(sec1 == sec2){
			  secchk=1;
			  alert("일치합니다.");
			  return true;
		  }
		  else{
			  alert("보안문자를 확인하세요");
			  document.join_form.usersec2.value="";
		  }
	  }
	  function quiz(){
		var q= new Array(2,3,4,5,6);
	  }

	  function idcheck(){
		  var id = document.join_form.userid.value;
		  if(id.length<1 || id==null){
		   alert("중복체크할 아이디를 입력하십시오");
		   return false;
		  }
		  var url = "idCheck.jsp?id=" + id;
		  window.open(url, "get", "height = 200, width = 350");
	  }
	  function pwcheck(){
		  var pw1 = document.join_form.userpw.value;
		  var pw2 = document.join_form.userpwcheck.value;
		  
		  if(pw1==pw2){
			  alert("일치합니다.");
		  }
		  else{
			  alert("비밀번호를 확인해주세요");
			  document.join_form.userpwcheck.value="";
		  }
	  }
	  function sub(){
          var fr = document.getElementById("join_form");
          for(i=0; i < fr.elements.length; i++) {
              if (fr.elements[i].value == ""){
                  alert("빈칸을 채우세요.");
                  fr.elements[i].focus();
                  return false;
              }
          }
          if(document.getElementById("checkid").value == 1){
        	  alert("아이디 중복체크를 해주세요.");
        	  return false;
          }
          if(secchk == 0){
        	  alert("보안문자 확인을 클릭하세요.");
        	  return false;
          }
          return true;
      }
	  /**
 * 
 */