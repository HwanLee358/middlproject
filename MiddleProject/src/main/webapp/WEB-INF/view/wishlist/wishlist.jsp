<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/wishlist.css" rel="stylesheet" />    
<form name="orderform" id="orderform" method="post" class="orderform" action="/Page">

    <input type="hidden" name="cmd" value="order">

    <div class="basketdiv" id="basket">
    
    <!-- 일반상품부분 -->
    <div>
    	<h4>일반상품</h4>
    </div>
	
      <!-- 헤더부분. -->
      <div class="row head">
        <div class="subdiv">
          <div class="check"><input type = "checkbox" name = 'buy' value = 'selectall' onclick='selectAll(this)'></div>
          <div class="img">이미지</div>
          <div class="pname">상품정보</div>
        </div>
        <div class="subdiv">
          <div class="basketprice">가격</div>
          <div class="delivery_fee" style="display: none;">배송비</div>
          <div class="sum" style="display: none;">합계</div>
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
          <div class="check"><input type="checkbox" name="buy" value="260" checked="checked">&nbsp;</div>
          <div class="img"><img src="images/과테말라 안티구아.jpg" width="60"></div>
          <div class="pname"> <span>찜마마(XJ-92214/1)</span> </div>
        </div>
        <div class="subdiv">
          <div class="basketprice">
            <input type="hidden" name="p_price" id="p_price0" class="p_price" value="20000">20,000원
          </div>
          <div class="num">
            <div class="updown">
              <input type="hidden" name="p_num0" id="p_num0" size="1" maxlength="2" class="p_num" value="2"
                onkeyup="javascript: basket.changePNum(0);">
               <span class="updown-btn" onclick="javascript: basket.changePNum(0);">
                <i class="fas fa-arrow-alt-circle-up up"></i>
              </span>
              <span class="updown-btn" onclick="javascript: basket.changePNum(0);">
                <i class="fas fa-arrow-alt-circle-down down"></i>
               </span>
            </div>
          </div>
          <div class = "delivery_fee" style="display: none;">3000원</div>       
          <div class="sum" id = "p_sum2" style="display: none;">40,000원</div>
        </div>
        <div class="subdiv">
          <div class="basketcmd">
            <a href="javascript:void(0)" class="abutton" onclick="javascript:wishlist.delItem();">삭제</a>
          </div>
        </div>
      </div>
      <!-- 데이터 부분. -->

    </div>


    <!-- 합계정보보여주기. -->
    <div><h4>[기본배송]</h4>
	</div>
    <!-- 선택삭제. -->
    <div class="right-align basketrowcmd">
      <a href="javascript:void(0)" class="abutton"
       	 onclick="javascript:wishlist.delCheckedItem();">선택상품삭제</a>
      <a href="javascript:void(0)" class="abutton"
         onclick="javascript:wishlist.delAllItem();">위시리스트비우기</a>
    </div>
    <div id="goorder" class="">
      <div class="clear"></div>
      <div class="buttongroup center-align cmd">
        <a href="javascript:void(0);" onclick='wishtobasket()'>전체 상품 장바구니</a>
        <a href="javascript:void(0);" onclick="javascript:wishlist.orderSelectedItem()">선택한 상품 장바구니</a>
      </div>
    </div>

  </form>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="js/addBasket.js"></script>
  <script src="js/cartService.js"></script>
  <script src="js/wishlist2.js"></script>