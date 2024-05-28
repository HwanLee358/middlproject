<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="//cdn.datatables.net/2.0.7/css/dataTables.dataTables.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.7/js/dataTables.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script src="js/check.js"></script>

 <link href="css/join.css" rel="stylesheet" type="text/css">
 
<section class="py-5">

<div class ="head">
<h1>개인 정보 수정</h1>
</div>


	<form action="infoForm.do" class="login" method="post">
	<div class="card-body">
<!-- 		아이디꺼 readonly -->
			<input type="text" name="userId" id="id" class="form-control" autofocus required
			value="${member.userId}" >
			<br>
			<input type="password" name="userPW" id="pw" class="form-control" value="${member.userPW}"
			onchange="check_pw()" required placeholder="패스워드 특수문자포함 4글자이상">
			<br>
			<input type="password" name="userPW2" id="pw2" placeholder="패스워드 확인" class="form-control"
			onchange="check_pw()" required> &nbsp;<span id="check"></span>
			<br>
			<input type="text" name="name" class="form-control" required placeholder="이름" value="${member.name}"/>
			<br>
			<input type="text" name="address1" id="sample4_postcode" class="form-control" placeholder="우편번호"value="${member.address1}">
			<input type="button" class = "btn btn-primary" onclick="sample4_execDaumPostcode()" class="form-control" value="우편번호 찾기"><br>
			<input type="text"  name="address2" id="sample4_roadAddress" class="form-control" placeholder="도로명주소" required value="${member.address2}"> <br>
			<input type="text" name="address3" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" required value="${member.address3}"> 
					<span id="guide" style="color: #999; display: none"></span> <br> 
			<input type="text" name="address4" id="sample4_detailAddress" class="form-control" placeholder="상세주소" value="${member.address4}"><br>
	
		    <input type="text" name="phone" class="form-control" required placeholder="전화번호" value="${member.phone}"/><br>
		
			<input type="text" name="email" class="form-control" required placeholder="이메일" value="${member.email}"/><br>

			<input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="수정">
	</div>
	
	</form>
</div>
	 <div class="links">
  	<a href="logForm.do">취소</a>
 	 </div>
 	 
 

</section>