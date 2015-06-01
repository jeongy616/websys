
	window.onload = function sec(){//보안번호 확인
		  var sec = Math.ceil(Math.random()*1000000);
		  var out=document.getElementById("usersec1");
		  out.value = sec;
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
			  alert("같습니다");
		  }
		  else{
			  alert("비밀번호를 확인해주세요");
			  document.join_form.userpwcheck.value="";
		  }
	  }
	  function sub(){
          var fr = document.getElementById("join_form");

          for (i = 0; i < fr.elements.length; i++) {
              if (fr.elements[i].value == NULL) {
                  alert("모두 작성해주세요.");
                  fr.elements[i].focus();
                  return false;
              }
          }
          fr.submit();
      }
	  /**
 * 
 */