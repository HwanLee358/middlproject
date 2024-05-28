<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/loginForm.css">
<link href="css/login.css" rel="stylesheet" type="text/css">

<section class="py-5">
	<div class="card align-middle" style="width: 25rem;">
		<div class="card-title" style="margin-top: 30px;">

			<h2 class="card-title" style="color: #f58b34;">
				<img src="images/옷들.jpg" />
			</h2>
		</div>
		<form action="login.do" class="login" method="post">

			<div class="checkbox">
				<label> <input type="radio" name="mode" value="admin">
					관리자 &nbsp;&nbsp; <input type="radio" name="mode" value="member"
					checked> 일반회원
				</label>
			</div>
			<div class="card-body">
				<input type="text" name="userId" id="Id" class="form-control" placeholder="아이디" autofocus required><BR> 
				<input type="password" name="userPW" id="Pw" class="form-control" placeholder="비밀번호" required><br>
				<p id="check" class="check">${login_msg}</p> <br /> 
				<input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="로 그 인">
			</div>
		</form>
	</div>

	<div class="links">
		<a href="findIdForm.do">아이디 찾기</a> |
		<a href="findPWForm.do">비밀번호찾기</a> | 
		<a href="joinForm.do">회원가입</a>
	</div>
</section>