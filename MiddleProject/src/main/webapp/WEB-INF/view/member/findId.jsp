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
    <link href="css/findId.css" rel="stylesheet" type="text/css">
    <title>아이디 찾기</title>
   
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#f58b34;"><img src="images/옷들.jpg" /></h2>
		</div>
		
		<div class="card-body">
      <form action="findId.do" class="form-signin" method="POST">
  		 <p class="text2"> ${findid2}</p>
        <input type="text" name="userName" id="userName" class="form-control" placeholder="이름" required autofocus><BR>
        <input type="text" name="userPhone" id="userPhone" class="form-control" placeholder="전화번호 EX)010-1111-2222" required><br>
        	<p class="check" id="check">${check}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아 이 디 찾 기</button>
      
      </form>
        
		</div>
        <div class="links">
            <a href="findPWForm.do">비밀번호 찾기</a> | 
            <a href="logForm.do">로그인</a> | 
            <a href="joinForm.do">회원가입</a>

        </div>
	</div>
   
  </body>

</html>