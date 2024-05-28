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
		 Object data = session.getAttribute("userId");
		 String finduid = (String)data;
  		 %>
  		 
	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#f58b34;"><img src="images/옷들.jpg"/></h2>
		</div>
        
		<div class="card-body">
      <form action="findId.do" class="form-signin" method="POST">
      <input type="hidden" name="userId" value=<%= finduid %>>
      <p class="check" id="check">내 아이디 : < <%= finduid %> ></p><br/>
      </form>
        
		</div>
        <div class="links">
            <a href="findPWForm.do">비밀번호 찾기</a> | <a href="logForm.do">로그인</a> | <a href="joinForm.do">회원가입</a>

        </div>
	</div>
  
   		
  </body>
  
<script type="text/javascript">

	
	  	//아이디 정규식
		var idJ = /^[a-z0-9]{5,20}$/;
		
  		$("#userId").focusout(function(){
	     if($('#userId').val() == ""){
	   		$('#checks').text('아이디를 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  		
  		//$("#member_id").focusout(function(){
  		//	if(!idJ.test($(this).val())){
  		//	$('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
  		//	$('#checks').css('color', 'red');
  	//	}
  	//	 });
  		
  		$("#userName").focusout(function(){
	     if($('#userName').val() == ""){
	   		$('#checks').text('이름을 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
	     
  		$("#userPhone").focusout(function(){
	     if($('#userPhone').val() == ""){
	   		$('#checks').text('전화번호를 입력해주세요');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  
  </script>
</html>