<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="member-container">
	<form name="myFrm" action="memberRemove.do">
		<c:forEach var="member" items="${memberList }">
			<input type="hidden" name="userId" value="${member.userId }">
			<table>
				<thead>
					<tr>
						<th>User ID</th>
						<th>NickName</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${member.userId }</td>
						<td>${member.userName }</td>
						<td>${member.userEmail }</td>
						<td>${member.userPhone }</td>
						<td>우편: ${member.address1 } ${member.address2 }
							${member.address3 } ${member.address4 }</td>
						<td><button type="submit" class="del-button"
								>삭제</button></td>
					</tr>
				</tbody>
			</table>
		</c:forEach>
	</form>
</div>


<style>
.del-button {
	border: 2px solid #f44336;
	color: black;
	padding: 2px 7px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.del-button:hover {
	background-color: #f44336;
	color: white;
}

body {
	padding: 1.5em;
	background: #f5f5f5
}

.member-container {
	display: flex;
	justify-content: space-between;
	width: 1000px;
	margin: 0 auto;
	padding-top: 20px;
	margin: 100px;
}

table {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: left;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #73685d;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
	text-align: center;
	<form name="myFrm">
		<input type="hidden" name="qno" value="${qnaInfo.postNo }"> 
		<input type="hidden" name="write" value="${qnaInfo.userId }"> 
		<input type="hidden" name="title" value="${qnaInfo.postTitle }"> 
		<input type="hidden" name="content" value="${qnaInfo.content }"> 
		<input type="hidden" name="pNo" value="${pNo }">
	</form>
	
	<table>
		<thead>
			<tr>
				<th>User ID</th>
				<th>NickName</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Address</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${member.userId }</td>
					<td>${member.userName }</td>
					<td>${member.userEmail }</td>
					<td>${member.userPhone }</td>
					<td>우편: ${member.address1 } ${member.address2 }
						${member.address3 } ${member.address4 }</td>
					<td><button class="del-button">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
document.querySelector('.btn-del-button').addEventListener('click', function() {
	document.forms.myFrm.action = "memberRemove.do";
	document.forms.myFrm.submit();
})
</script>

<style>
.del-button {
	border: 2px solid #f44336;
	color: black;
	padding: 2px 7px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.del-button:hover {
	background-color: #f44336;
	color: white;
}

body {
	padding: 1.5em;
	background: #f5f5f5
}

.member-container {
	display: flex;
	justify-content: space-between;
	width: 1000px;
	margin: 0 auto;
	padding-top: 20px;
	margin: 100px;
}

table {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: left;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #73685d;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	color: #73685d;
}

@media all and (max-width: 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		text-align: right;
	}
	table {
		position: relative;
		padding-bottom: 0;
		border: none;
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	}
	thead {
		float: left;
		white-space: nowrap;
	}
	tbody {
		overflow-x: auto;
		overflow-y: hidden;
		position: relative;
		white-space: nowrap;
	}
	tr {
		display: inline-block;
		vertical-align: top;
	}
	th {
		border-bottom: 1px solid #a39485;
	}
	td {
		border-bottom: 1px solid #e5e5e5;
	}
}
</style>