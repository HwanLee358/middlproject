<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/qnaboard.css" rel="stylesheet"/>
<link href="css/wearList.css" rel="stylesheet" />    
<div class="detailQnaList">
	<div class="wrapper">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2>
					<span>취소/교환/반품 </span>
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
					<tr class="nbg" style="display:none">
						<td><div class="tb-center"><span class="reviewnum">252</span></div></td>
						<td><div class="tb-center"><span class="reviewnum"></span></div></td>
						<td><div class="tb-center"><span class="reviewnum"><a href="#">상품문의</a></span></div></td>
						<td><div class="tb-center"><span class="reviewnum">이름</span></div></td>
						<td><div class="tb-center"><span class="reviewnum">날짜</span></div></td>
						<td><div class="tb-center"><span class="reviewnum">조회수</span></div></td>
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
						<a href="" class="next">></a>						
					</div>
				</div>
				<div class="btm_write">
				<c:choose>
					<c:when test="${empty logId}">
						<a href="logForm.do">문의하기</a>
					</c:when>
					<c:otherwise>
						<a href="qnaWriteForm.do?pno=${result.orderNo }">문의하기</a>					
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	const qnaNo = ${result.orderNo }
</script>    
<script src="js/qnalist.js"></script>