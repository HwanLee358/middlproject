<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/result.css" rel="stylesheet" type="text/css">
    
    <title>아이디 찾기</title>

  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
		
		 <%
		 Object data = session.getAttribute("findid");
		 String finduid = (String)data;
  		 %>
  		 
	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#f58b34;"><img src="images/옷들.jpg"/></h2>
		</div>
        
		<div class="card-body">
      <form action="resetPw" class="form-signin" method="POST">
      <input type="hidden" name="member_id" value=<%= finduid %>>
      <p class="check" id="check">내 패스워드 : < <%= finduid %> ></p><br/>
      
      </form>
        
		</div>
        <div class="links">
            <a href="memberId">아이디 찾기</a> | <a href="memberLogin">로그인</a> | <a href="memberRegist">회원가입</a>

        </div>
	</div>
  
   		
  </body>
  
  <script >
	
  	var check2 = "${findpw_checkt}";
	if(check2 != ""){
	 	alert(check2);
	}
	
	// 비밀번호 정규식
	var pwJ = /^[a-z0-9]{6,20}$/; 
	var pwc = false;
	var pwc2 = false;
	
	$("#pw").focusout(function(){
	     if($('#pw').val() == ""){
	   		$('#check').text('비밀번호를 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   	  	
	     }else if(!pwJ.test($(this).val())){
			$('#check').text('6~20자의 영문 소문자, 숫자만 사용가능합니다');
			$('#check').css('color', 'red');
	     }else{
	    	 pwc2 = true;
	    	 $('#check').hide();
	     }
	  });
	
	$("#pw2").focusout(function(){
	     if($('#pw2').val() == ""){
	   		$('#check').text('필수 정보입니다.')
	   	  	$('#check').css('color', 'red')
	 	}else
   	 	$('#check').hide()
	  });
	
	$("#pw2").keyup(function(){
		   
	    if($(this).val()!=$("#pw").val()){
	        $("#check2").html("비밀번호가 다릅니다");
	        $("#check2").css("color",'red');
	        pwc = false;
	
	    }else{
	        $("#check2").html("비밀번호가 일치합니다");
	        $("#check2").css("color",'blue');
	        pwc = true;
	    }
	});
	
	$("#pw").keyup(function(){
		     
	    if($(this).val()!=$("#pw2").val()){
	        $("#check2").html("비밀번호가 다릅니다");
	        $("#check2").css("color",'red');
	        pwc = false;
	
	    }else{
	        $("#check2").html("비밀번호가 일치합니다");
	        $("#check2").css("color",'blue');
	        pwc = true;
	    }
	});

	function regist(){
		if(pwc2 == false){
		      alert('비밀번호는 6~20자의 영문 소문자, 숫자만 사용가능합니다')
		 }else if(pwc == false ){
			  	alert('비밀번호를 다시 확인해주세요')
		}else{
		 $('form').submit();
		}
		<%session.invalidate();%>
		};
  </script>
</html>