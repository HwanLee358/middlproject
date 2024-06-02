<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>	
<link href="css/qnaboard.css" rel="stylesheet" />
<link href="css/wearList.css" rel="stylesheet" />
<style>
.thmb_area{
	margin-top: 10px;
	margin-bottom: 10px;
}
.thmb_area .thmb{
	float: left;
}
</style>
<div class="detailQnaList">
	<div class="wrapper">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2>
					<span>주문/내역</span>
				</h2>
				<!-- sub -->
				<span></span>
			</div>
		</div>
		<div class="info_section">
			<h4 style="font-size: 18px;">상품구매 내역</h4>
			<div class="table-slide qna-list">
				<table>
					<caption></caption>
					<colgroup>
						<col width="160px;">
						<col width="440px;">
						<col width="140px;">
						<col width="110px;">
						<col width="105px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">
								<div class="tb-center">주문일</div>
							</th>
							<th scope="col">
								<div class="tb-center">주문내역</div>
							</th>
							<th scope="col">
								<div class="tb-center">수량</div>
							</th>
							<th scope="col">
								<div class="tb-center">주문번호</div>
							</th>
							<th scope="col">
								<div class="tb-center">주문금액</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list1" items="${orList }">
						<tr class="nbg">
							<th rowspan="${list1.product_cnt +1 }">
								<div class="tb-center">${list1.product_date }</div>
							</th>
						</tr>
						<c:forEach var="list2" items="${list1.order_info }">
						<tr class="nbg">
							<th>
								<div class="tb-center thmb_area">
									<img alt="" src="images/wear/${list2.productImg }.jpg" width="90" height="90" class="thmb">
									<a href="productDetail.do?pno=${list2.productNo }" style="display:block;">
										<h4>${list2.productName }</h4>
										<div>
											color : ${list2.productColor }
											size  : ${list2.productSize }
										</div>
									</a>
								</div>
							</th>
							<td><div class="tb-center">${list2.productCnt } 개</div></td>
							<td><div class="tb-center">${list2.orderNo }</div></td>
							<td><div class="tb-center"><fmt:formatNumber>${list2.productPrice * list2.productCnt}</fmt:formatNumber>원</div></td>
						</tr>
						</c:forEach>
						</c:forEach>									
					</tbody>
				</table>
			</div>
		</div>
		<!-- paging -->
		<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
			<c:if test="${orderPaging.prev }">
			<a href="#" class="first">
				<img src="images/btn_page_prev.png" />
			</a>
			</c:if>
			<ol>
				<c:forEach var="p" begin="${orderPaging.startPage }" end="${orderPaging.endPage }">
				<li class="xans-record-">							
					<a href="orderInfo.do?page=${p }" class="${p == orderPaging.page ? 'this' : 'other' }">${p }</a>					
				</li>
				</c:forEach>
			</ol>
			<c:if test="${orderPaging.next }">
			<a href="#" class="last" style="center">
				<img src="images/btn_page_next.png" />
			</a>
			</c:if>
		</div>
	</div>
</div>