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
    <title>탈퇴실패</title>
   
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#f58b34;"><img src="images/실패.jpg" /></h2>
		</div>
		
		<div class="card-body">
     		 <h4> 비밀번호가 일치하지않습니다.</h4>
      		</div>
        <div class="links">
         <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href = 'list.do?id=${logId }' "><b>메인페이지</b></button>
       <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href = 'info.do?id=${logId }' "><b>마이페이지</b></button>

        </div>
	</div>
   
  </body>

</html>