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
					<span>찜마마(XJ-92214/1)</span><br><br>
					<span>사이즈 : L</span><span>색깔 : RED</span>
				</div>
			</div>
			<div class="subdiv">
				<div class="basketprice">
					<input type="hidden" name="p_price" id="p_price0" class="p_price"
						value="20000">20,000원
				</div>
				<div class="num">
					<div class="updown">
						<input type="number" name="p_num0" id="p_num0" size="1" min="1" class="p_num" value="1" onkeyup="javascript: basket.changePNum(this);"> 
					</div>
				</div>
				<!-- 에러나면 지울곳 -->
				<div class="delivery_fee">무료</div>
				<!-- 에러나면 지울곳 -->

				<div class="sum" id="p_sum">40,000원</div>
			</div>
			<div class="subdiv">
				<div class="basketcmd">
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
			<a href="orderForm.do?form=basket&selete=all"
				onclick="javascript:basket.orderAllItem()">전체 상품 주문</a> <a
				href="javascript:void(0);"
				onclick="javascript:basket.orderSelectedItem()">선택한 상품 주문</a>
		</div>
	</div>
</form>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="js/cartService.js"></script>
<script src="js/basket2.js"></script>