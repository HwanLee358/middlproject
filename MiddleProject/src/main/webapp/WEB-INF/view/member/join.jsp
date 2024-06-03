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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="//cdn.datatables.net/2.0.7/js/dataTables.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   	<script src="js/daum.js"></script>
	<script src="js/check.js"></script>
    <title>회원가입 폼</title>
    
 <link href="css/findId.css" rel="stylesheet" type="text/css">
 <style>
   .join{
    margin-bottom : 50px;
    font-family: "Nanum Gothic", arial, helvetica, sans-serif;
    text-align: center;
    }
 </style>
  </head>
  
<div class="join">
	<h2> 회원가입에 오신걸 환영합니다!</h2>
	</div>

	
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%">

	<div class="card" style="width:40rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#e4932b;"><img src="images/회원가입옷.jpg" /></h2>
		</div>
		<div class="card-body">
		
      <form action="join.do" class="form-signin" method="POST" >
        <p class="text">아이디</p>
        <input type="text" name="userId" id="member_id"  class="form-control" placeholder="입력해주세요" required>
        &nbsp; &nbsp;
        <input type="button" id="overlay"  required placeholder="입력해주세요" onclick="checkUserId()" value="중복 체크"/><br/>
        <p id="idch" class="check"> </p><br/>
        <p class="text">비밀번호</p>
        <input type="password" name="userPW" id="pw" placeholder="입력해주세요" class="form-control" onchange="check_pw()"><br>
        <p id="pw2ch" class="check"> </p><br/>
        <p class="text">비밀번호 확인</p>
        <input type="password"  id="pw2" class="form-control" placeholder="입력해주세요" onchange="check_pw()" required> &nbsp;<span id="check"></span> 
       <p id="pwch" class="check"> </p><br/>
        <p class="text">이름</p>
        <input type="text" name="name" id="name" class="form-control" placeholder="입력해주세요" required><br>
        <p id="namech" class="check"> </p><br/>
        <p class="text">주소</p>
            <input type="text" name="address1" id="sample4_postcode" class="form-control" placeholder="우편번호">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
           	<input type="text"  name="address2" id="sample4_roadAddress" class="form-control" placeholder="도로명주소" required> <br>
            <input type="text" name="address3" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" required> 
				<span id="guide" style="color: #999; display: none"></span> <br> 
			<input type="text" name="address4" id="sample4_detailAddress" class="form-control" placeholder="상세주소" required><br>
        <p class="text">이메일</p>
        <input type="email" name="email" id="email" class="form-control" placeholder="입력해주세요" required>

        <p class="text">전화번호</p>
        <input type="text" name="phone" id="phone" class="form-control" placeholder="010-0000-0000형식"required><br><br>
       <p id="phonech" class="check"> </p><br/>
       
        <input type="submit" id="btn-Yes" class="btn btn-lg btn-primary btn-block" value="회원가입">
    </form>
    
    <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href = 'list.do' "><b>메인페이지</b></button>
        
		</div>
       
	</div>
   
  </body>

</html>