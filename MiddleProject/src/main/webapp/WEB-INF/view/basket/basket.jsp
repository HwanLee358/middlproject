<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/cart.css" rel="stylesheet" />    
<form name="orderform" id="orderform" method="post" class="orderform"
	action="/Page">

	<input type="hidden" name="cmd" value="order">

	<div class="basketdiv" id="basket">
		<div class="orderHeader">
			<h1 class="tit_common">
				<span>BASKET</span>
			</h1>
		</div>

		<!-- 일반상품부분 -->
		<div>
			<h4>일반상품</h4>
		</div>
		<!-- 헤더부분. -->
		<div class="row head">
			<div class="subdiv">
				<div class="check">
					<input type="checkbox" name='buy' value='selectall'
						onclick='selectAll(this)'>
				</div>
				<div class="img">이미지</div>
				<div class="pname">상품정보</div>
			</div>
			<div class="subdiv">
				<div class="basketprice">가격</div>
				<div class="num">수량</div>
				<div class="delivery_fee">배송비</div>
				<div class="sum">합계</div>
			</div>
			<div class="subdiv">
				<div class="basketcmd">선택</div>
			</div>
			<div class="split"></div>
		</div>
		<!-- 헤더부분. -->

		<!-- 데이터 부분. -->
		<div class="row data" data-id="0" style="display: none;">
			<div class="subdiv">
				<div class="check">
					<input type="checkbox" name="buy" value="260" checked="checked">&nbsp;
				</div>
				<div class="img">
					<img src="images/과테말라 안티구아.jpg" width="60">
				</div>
				<div class="pname">
					<span>찜마마(XJ-92214/1)</span>
				</div>
			</div>
			<div class="subdiv">
				<div class="basketprice">
					<input type="hidden" name="p_price" id="p_price0" class="p_price"
						value="20000">20,000원
				</div>
				<div class="num">
					<div class="updown">
						<input type="text" name="p_num0" id="p_num0" size="1"
							maxlength="2" class="p_num" value="2"
							onkeyup="javascript: basket.changePNum(0);"> 
						<span
							class="updown-btn" onclick="javascript: basket.changePNum(0);">
							<a href="javascript:;"
							onmousedown="javascript:try{AW_F_D('4303','i',1);}catch(e){}">
								<img
								src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
								alt="수량증가" class="up">
						</a>
						</span> 
						<span class="updown-btn"
							onclick="javascript: basket.changePNum(0);"> <a
							href="javascript:;"
							onmousedown="javascript:try{AW_F_D('4303','o',1);}catch(e){}">
								<img
								src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
								alt="수량감소" class="down">
						</a>
						</span>
					</div>
				</div>
				<!-- 에러나면 지울곳 -->
				<div class="delivery_fee">3000원</div>
				<!-- 에러나면 지울곳 -->

				<div class="sum" id="p_sum">40,000원</div>
			</div>
			<div class="subdiv">
				<div class="basketcmd">
					<!--   <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">주문하기</a>
            <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">관심상품등록</a>-->
					<a href="javascript:void(0)" class="abutton"
						onclick="javascript:basket.delItem();">삭제</a>
				</div>
			</div>
		</div>
		<!-- 데이터 부분. -->

	</div>


	<!-- 합계정보보여주기. -->
	<div>
		<h4>[기본배송]</h4>
		<div class="bigtext right-align sumcount" id="sum_p_num">
			상품갯수: <span>4</span>개
		</div>
		<div class="bigtext right-align box blue summoney" id="sum_p_price">
			합계금액: <span>74,200</span>원
		</div>
	</div>
	<!-- 선택삭제. -->
	<div class="right-align basketrowcmd">
		<a href="javascript:void(0)" class="abutton"
			onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> <a
			href="javascript:void(0)" class="abutton"
			onclick="javascript:basket.delAllItem();">장바구니비우기</a>
	</div>
	<div id="goorder" class="">
		<div class="clear"></div>
		<div class="buttongroup center-align cmd">
			<a href="javascript:void(0);"
				onclick="javascript:basket.orderAllItem()">전체 상품 주문</a> <a
				href="javascript:void(0);"
				onclick="javascript:basket.orderSelectedItem()">선택한 상품 주문</a>
		</div>
	</div>
	<div class="xans-element- xans-order xans-order-totalsummary ec-base-table typeList gBorder total  ">
		<table border="1" summary="">
			<caption>총 주문금액</caption>
			<colgroup>
				<col style="width: 23%;">
				<col style="width: 24%;">
				<col style="width: 23%;" class="">
				<col style="width: auto;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><strong>총 상품금액</strong> <a href="#none"
						onclick="OrderLayer.onDiv('order_layer_detail', event);"
						class="more displaynone"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif"
							alt="내역보기"></a></th>
					<th scope="col"><strong>총 배송비</strong></th>
					<th scope="col"><strong>결제예정금액</strong></th>
				</tr>
			</thead>
			<tbody class="center">
				<tr>
					<td><div class="box txt16">
							<strong><span class="txt21"><span
									class="total_product_price_display_front">47,700</span></span>원</strong> <span
								class="txt14 displaynone"><span
								class="total_product_price_display_back"></span></span>
						</div></td>
					<td>
						<div class="box shipping txt16">
							<strong><span class="txt21"><span
									class="total_delv_price_front">3,000</span></span>원</strong> <span
								class="txt14 displaynone"><span
								class="total_delv_price_back"></span></span>
							<div class="shippingArea displaynone">
								(<span></span>
								<div class="shippingFee">
									<a href="#none" class="button" id=""><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_details.gif"
										alt="자세히보기"></a>)
									<div class="ec-base-tooltip" style="display: none;">
										<h3>배송비할인</h3>
										<div class="content">
											<h4></h4>
											<table border="1" summary="">
												<caption>배송비 할인 이벤트 정보</caption>
												<tbody>
													<tr>
														<th scope="row">혜택</th>
														<td><strong class="txtEm"></strong>
															<p></p></td>
													</tr>
													<tr class="displaynone">
														<th scope="row">기간</th>
														<td><strong class="txtEm"></strong>
															<p></p></td>
													</tr>
													<tr class="displaynone">
														<th scope="row">대상</th>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
										<a href="#none" class="btnClose"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif"
											alt="닫기"></a> <span class="edge"></span>
									</div>
								</div>
							</div>
						</div>
					</td>
					<td><div class="box txtEm txt16">
							<strong><span class="txt21">41,700</span>원</strong> <span
								class="txt14 displaynone"></span>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>	
</form>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/cartService.js"></script>
<script src="js/basket2.js"></script>