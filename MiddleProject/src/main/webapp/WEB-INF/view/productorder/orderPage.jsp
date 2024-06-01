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

.list-btm{
	margin-top : 10px;
	display: block;
	text-align: center;
}

.payMent {
	 width: 235px;
    background: #000;
    border-color: #000;
    color: #fff;
    font-weight: 600;
    
    min-width: 142px;
    height: 46px;
    border: 1px solid #d0d0d0;
    line-height: 46px;
    text-align: center;
    font-size: 14px;
}
.calCel{
	min-width: 142px;
    height: 46px;
    border: 1px solid #d0d0d0;
    line-height: 46px;
    text-align: center;
    font-size: 14px;
    color: #000;
    box-sizing: border-box;
}
</style>
<script>
function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample4_postcode').value = data.zonecode;
			document.getElementById("sample4_roadAddress").value = roadAddr;
			document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			// if(roadAddr !== ''){
			//     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			// } else {
			//     document.getElementById("sample4_extraAddress").value = '';
			//  }

			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if (data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				guideTextBox.style.display = 'block';

			} else if (data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				guideTextBox.style.display = 'block';
			} else {
				guideTextBox.innerHTML = '';
				guideTextBox.style.display = 'none';
			}
		}
	}).open();
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//cdn.datatables.net/2.0.7/js/dataTables.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/daum.js"></script>

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
				<span></span>
			</div>
		</div>
		<form id="imp">
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
								<input type="text" name="name" value="${member.userName }">
							</td>
						</tr>
						<tr>
							<th scope="col">
								<div class="tb-center">연락처</div>
							</th>
							<td>
								<input type="text" name="phone" value="${member.userPhone }">
							</td>
						</tr>
						<tr>
							<th scope="col">
								<div class="tb-center">주소</div>
							</th>
							<td>
								<input type="text" name="address1" class="text" id="sample4_postcode" placeholder="우편번호"readonly="readonly" value="${member.address1 }">
            					<input type="button" onclick="sample4_execDaumPostcode()"  value="우편번호 찾기"><br>
            					<input type="text"  name="address2" id="sample4_roadAddress" class="form-control" placeholder="도로명주소" required value="${member.address2 }">
								<input type="text" name="address3" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" required value="${member.address3 }">
            					<span id="guide" style="color:#999;display:none"></span>
            					<input type="text" name="address4" id="sample4_detailAddress" class="form-control" placeholder="상세주소" value="${member.address4 }"><br> 
							</td>
						</tr>
						<tr>
							<th scope="col">
								<div class="tb-center">이메일</div>
							</th>
							<td>
								<input type="email" name="email" value="${member.userEmail }">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</form>
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
							<input type="hidden" name="pno"class="productInfo" value="${oList.productInfoNo }"/>
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
										<span class="reviewnum pprice" data-pPrice="${oList.productPrice }">${oList.productPrice }</span>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<span class="reviewnum pcnt" data-pCnt="${oList.productCnt eq 0 ? 1 : oList.productCnt }">${oList.productCnt eq 0 ? 1 : oList.productCnt }개</span>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<span class="reviewnum">3,000원</span>
									</div>
								</td>
								<td>
									<div class="tb-center">
										<span class="reviewnum">${oList.productPrice * (oList.productCnt eq 0 ? 1 : oList.productCnt) + 3000}원</span>
									</div>
								</td>
							</tr>
							<c:set var="total" value="${total + (oList.productPrice * (oList.productCnt eq 0 ? 1 : oList.productCnt) + 3000) }" />
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
					<button class="calCel">취소</button>
					<button class="payMent">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="js/order.js" ></script>