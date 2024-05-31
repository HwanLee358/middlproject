<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
 <head>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

 <link href="css/findId.css" rel="stylesheet" type="text/css">
    <title>개인정보수정</title>
 
 <style>
   .join{
    margin-bottom : 50px;
    font-family: "Nanum Gothic", arial, helvetica, sans-serif;
    text-align: center;
    }
    .table{
    border : 1px solid #fff;
    text-align : center ;
    padding : 10px;
 	margin : 0 auto;
    }
	.legend{
	border : 1px solid #black;
	margin : auto;
	}
 </style>
 
  </head>
  
<div class="join">
<h3>회원탈퇴</h3>
	</div>
	
<form name="myFrm" action="delete.do">
<div class="legend" style="width: 1000px;">

  <table class="table">
    <tr>
      <th>아이디</th>
      <td>${result.userId}</td>
    </tr>
    <tr>
      <th>이름</th>
      <td>${result.userName}</td>
    </tr>
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="userPW" placeholder="패스워드 입력">
     </td></tr>
    <tr align="center">
      <td colspan="2"><input class="btn btn-primary" type="submit" value="회원탈퇴"></td>
    </tr>
  </table>
  <input type="hidden" name="userId" value="${result.userId}">
  </div>
</form>




