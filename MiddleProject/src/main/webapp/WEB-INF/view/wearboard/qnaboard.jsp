<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/wearList.css" rel="stylesheet" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.detailQnaList {
	padding-bottom: 110px;
}

.detailQnaList .wrapper {
	width: 1366px;
	margin: auto; 
}

.qna-list {
	border-top: 3px solid #000;
}

.qna-list colgroup {
	display: table-column-group;
	unicode-bidi: isolate;
}

.qna-list thead {
	display: table-header-group;
	vertical-align: middle;
	unicode-bidi: isolate;
	border-color: inherit;
}

.qna-list table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	word-wrap: break-word;
	word-break: keep-all;
}

.qna-list col {
	display: table-column;
	unicode-bidi: isolate;
}

.qna-list hr, caption, legend {
	display: none;
}

.qna-list tr {
	display: table-row;
	vertical-align: inherit;
	unicode-bidi: isolate;
	border-color: inherit;
}

.qna-list table th {
	height: 46px;
	font-size: 13px;
	border-bottom: 1px solid #e9e9e9;
	font-weight: normal;
}

.qna-list .tb-center {
	text-align: center;
}

.qna-list .tb-left, .tb-center, .tb-right {
	padding: 0 10px;
}

.qna-list tbody {
	display: table-row-group;
	vertical-align: middle;
	unicode-bidi: isolate;
	border-color: inherit;
}

.qna-list table td {
	height: 45px;
	font-size: 13px;
	border-bottom: 1px solid #e9e9e9;
}

.detailQnaList .list-btm {
	position: relative;
}

.detailQnaList .btm_write {
	position: absolute;
	top: 10px;
	left: 0;
}

.detailQnaList .btm_write a {
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	width: 110px;
	height: 40px;
	box-sizing: border-box;
	border: 1px solid #000;
	font-size: 13px;
	-webkit-transition: all 0.3s ease;
	transition: all 0.3s ease;
}
.detailQnaList .paging-wrap .paging {
    text-align: center;
    padding: 20px 0;
}
.detailQnaList .paging-wrap .paging a {
    display: inline-block;
    vertical-align: top;
    padding: 10px 0px;
    text-align: center;
    font-size: 14px;
    margin: 0 4px;
    box-sizing: border-box;
    width: 33px;
    height: 36px;
    line-height: 16px;
}
.paging a:hover, .paging a.now, .paging .now {
    color: #000;
    font-weight: 600;
}
</style>
<div class="detailQnaList">
	<div class="wrapper">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2>
					<span>Q&A</span>
				</h2>
				<!-- sub -->
				<span>상품에 대해 궁금한 점을 해결해 드립니다</span>
			</div>
		</div>
		<div class="table-slide qna-list">
			<table>
				<caption>QnA 리스트</caption>
				<colgroup>
					<col width="80">
					<col width="30">
					<col width="*">
					<col width="100">
					<col width="100">
					<col width="80">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><div class="tb-center">NO</div></th>
						<th scope="col"></th>
						<th scope="col"><div class="tb-center">SUBJECT</div></th>
						<th scope="col"><div class="tb-center">NAME</div></th>
						<th scope="col"><div class="tb-center">DATE</div></th>
						<th scope="col"><div class="tb-center">HIT</div></th>
					</tr>
				</thead>
				<tbody>
					<tr class="nbg">
						<td>
							<div class="tb-center">
								<span class="reviewnum">252</span>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<span class="reviewnum"></span>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<span class="reviewnum">상품문의</span>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<span class="reviewnum">이름</span>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<span class="reviewnum">날짜</span>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<span class="reviewnum">조회수</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="list-btm">
				<div class="paging-wrap">
					<div class="paging">
						<a href="" class="prev"><</a>
						<a href="" class="now">1</a>
						<a href="">2</a>
						<a href="">3</a>
						<a href="">4</a>
						<a href="">5</a>
						<a href="" class="">></a>						
					</div>
				</div>
				<div class="btm_write">
				<c:choose>
					<c:when test="${empty logId}">
						<a href="#" onclick='alert("로그인을 하세요")'>문의하기</a>
					</c:when>
					<c:otherwise>
						<a href="qnaWriteForm.do">문의하기</a>					
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
