<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="//cdn.datatables.net/2.0.7/css/dataTables.dataTables.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.7/js/dataTables.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script src="js/check.js"></script>

<!--<c:if test="${message != null}">
	<p>${message }</p>
</c:if>!-->
<!-- Section-->
<section class="py-5">

	<h1>회원가입</h1>

	<p class="required ">* 필수입력사항</p>

	<form action="join.do" method="post">
		<table class="table">

			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" id="id" required>
				<button id="CheckId" class="btn btn-primary" onclick="checkUserId()">중복확인</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPW" id="pw"
					onchange="check_pw()" required placeholder="4글자이상 16글자 이하"
					>
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="userPW2" id="pw2"
					onchange="check_pw()" required> &nbsp;<span id="check"></span></td>
			</tr>

			<tr>
				<th>이름*</th>
				<td><input type="text" name="name" required /></td>
			</tr>

			<tr>
				<th>주소*</th>
				<td>
				<input type="text" name="address1" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text"  name="address2" id="sample4_roadAddress" placeholder="도로명주소" required> <br>
				<input type="text" name="address3" id="sample4_jibunAddress" placeholder="지번주소" required> 
					<span id="guide" style="color: #999; display: none"></span> <br> 
				<input type="text" name="address4" id="sample4_detailAddress" placeholder="상세주소">
				</td>	
			</tr>
			<tr>
				<th>전화번호*</th>
				<td><input type="text" name="phone" required /></td>
			</tr>
			<tr>
				<th>이메일*</th>
				<td><input type="text" name="email" required /></td>
			</tr>

			<tr align="center">
				<td colspan="2"><input type="submit" value="회원가입"></td>
				<td colspan="2"><a href="logForm.do">취소</a> 
			</tr>


		</table>
	</form>
</section>