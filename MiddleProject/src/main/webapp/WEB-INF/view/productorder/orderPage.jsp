<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/qnaboard.css" rel="stylesheet" />
<link href="css/wearList.css" rel="stylesheet" />
<style>
thead .tb-center {
	font-weight: bold;
}

table td .tb-center img {
	width: 110px;
	height: 110px;
	vertical-align: top;
}

.product_title {
	padding: 24px 30px 30px 0;
	text-align: left;
}

table td .money_tot {
	height: 76px;
	padding: 0 20px;
	line-height: 76px;
}

table td .money_tot em {
	float: left;
	font-weight: 800;
	font-size: 21px;
}

table td .money_tot .int_black_big em {
	font-weight: 800;
	font-size: 19px;
	float: right;
}

em {
	font-style: normal;
}

.info_section {
	position: relative;
	margin-top: 60px;
}
</style>
<div class="detailQnaList">
	<div class="wrapper">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2>
					<span>주문/결제</span>
				</h2>
				<!-- sub -->
				<span>상품에 대해 궁금한 점을 해결해 드립니다</span>
			</div>
		</div>
		<div class="checkout_delivery">
			<h4 style="font-size: 18px;">배송지 정보</h4>
			<div class="table-slide qna-list">
				<table>
					<caption></caption>
					<colgroup>
						<col width="160px;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="col">
								<div class="tb-center">이름</div>
							</th>
							<td>
								${member.userName }
							</td>
						</tr>
						<tr>
							<th scope="col">
								<div class="tb-center">연락처</div>
							</th>
							<td>
								${member.userPhone }
							</td>
						</tr>
						<tr>
							<th scope="col">
								<div class="tb-center">주소</div>
							</th>
							<td>
								(${member.address1 }) ${member.address2 } ${member.address3 } ${member.address4 }
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="info_section">
			<h4 style="font-size: 18px;">주문상품 정보</h4>
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
							<th scope="col" colspan="2">
								<div class="tb-center">상품정보</div>
							</th>
							<th scope="col">
								<div class="tb-center">상품금액</div>
							</th>
							<th scope="col">
								<div class="tb-center">수량</div>
							</th>
							<th scope="col">
								<div class="tb-center">배송비</div>
							</th>
							<th scope="col">
								<div class="tb-center">주문금액</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="oList" items="${orderList }">
							<tr class="nbg">
								<td>
									<div class="tb-center">
										<a href=""> <img
											src="images/wear/${oList.productName }.jpg" alt="">
										</a>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<div class="product_title">
											<div class="info">
												<p class="title">${oList.productName }</p>
												<ul>
													<li>색깔 : ${oList.productColor } 사이즈 :
														${oList.productSize }</li>
												</ul>
											</div>
										</div>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<span class="reviewnum">${oList.productPrice }</span>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<span class="reviewnum">${oList.productCnt }개</span>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<span class="reviewnum">3,000원</span>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<span class="reviewnum">${oList.productPrice * oList.productCnt + 3000}원</span>
									</div>
								</td>
							</tr>
							<c:set var="total" value="${total + (oList.productPrice * oList.productCnt + 3000) }" />
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
								<div class="money_tot">
									<em>총 주문금액</em> <span class="int_black_big"> <em><c:out value="${total }" />원</em>
									</span>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
				<div class="list-btm">
					<button>취소</button>
					<button>결제하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
