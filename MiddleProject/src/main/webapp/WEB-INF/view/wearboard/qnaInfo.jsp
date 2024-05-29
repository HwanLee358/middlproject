<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/wearList.css" rel="stylesheet" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.qnainfoList {
	padding-bottom: 110px;
}

.qnainfoList .wrapper {
	width: 1000px;
	margin: auto;
}
.table {
    --bs-table-color: var(--bs-body-color);
    --bs-table-bg: transparent;
    --bs-table-border-color: var(--bs-border-color);
    --bs-table-accent-bg: transparent;
    --bs-table-striped-color: var(--bs-body-color);
    --bs-table-striped-bg: rgba(0, 0, 0, 0.05);
    --bs-table-active-color: var(--bs-body-color);
    --bs-table-active-bg: rgba(0, 0, 0, 0.1);
    --bs-table-hover-color: var(--bs-body-color);
    --bs-table-hover-bg: rgba(0, 0, 0, 0.075);
    width: 100%;
    margin-bottom: 1rem;
    color: var(--bs-table-color);
    vertical-align: top;
    border-color: var(--bs-table-border-color);
}
.table thead, tbody, tfoot, tr, td, th {
    border-color: inherit;
    border-style: solid;
    border-width: 0;
}
.table > :not(caption) > * > * {
    padding: 0.5rem 0.5rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}
</style>

<div class="qnainfoList">
	<div class="wrapper">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2>
					<span>Q&A</span>
				</h2>
				<!-- sub -->
			</div>
		</div>
		<div>
			<form name="myFrm">
				<input type="hidden" name="qno" value="${qnaInfo.postNo }">
				<input type="hidden" name="write" value="${qnaInfo.userId }">
				<input type="hidden" name="title" value="${qnaInfo.postTitle }">
				<input type="hidden" name="content" value="${qnaInfo.content }">
				<input type="hidden" name="pNo" value="${pNo }">
			</form>
			<table class="table">
				<tbody>
					<tr>
						<th style="width: 10%;">글 제목</th>
						<td colspan="3">${qnaInfo.postTitle }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td colspan="3">${qnaInfo.userId }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3" style="height: 200px;">${qnaInfo.content }</td>
					</tr>
					<tr>
						<th>작성일시</th>
						<td>${qnaInfo.creationDate }</td>
						<th>조회수</th>
						<td>${qnaInfo.views }</td>
					</tr>
					<c:choose>
						<c:when test="${qnaInfo.userId eq logId  }">
							<tr align="center">
								<td colspan="4">
									<button class="btn btn-primary" id="modBtn">수정</button>
									<button class="btn btn-danger">삭제</button>
								</td>
							</tr>						
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>

document.querySelector('#modBtn').addEventListener('click', function() {
	document.forms.myFrm.action = "qnaModifyForm.do";
	document.forms.myFrm.submit();
})

document.querySelector('.btn-danger').addEventListener('click', function() {
	document.forms.myFrm.action = "qnaDelte.do";
	document.forms.myFrm.submit();
})
</script>