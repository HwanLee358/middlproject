<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>회원탈퇴 페이지입니다</h3>

<form name="myFrm" action="delete.do">
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
</form>




