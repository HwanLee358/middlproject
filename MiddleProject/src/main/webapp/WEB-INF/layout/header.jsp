<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.util {
	margin-top: 5px;
	margin-right: 25px;
}
.util .boardSearch input {
    width: 100%;
    outline: none;
    padding: 0 10px;
    padding-bottom: 7px;
    background: url(images/icon-search.svg) no-repeat 98% 0;
    border: none;
    border-bottom: 2px solid #333;
    font-size: 14px;
    color: #999;
}
</style>   
<div id="JD-Header">
		<div class="headerWrap">
			<div class="headerTop">
				<div class="logo">
					<a href="/"> <span style="display: inline;">MONOLOGUE</span>
					</a>
				</div>
				<div class="memb_menu">
					<ul class="inwrap">
						<li class="xans-element- xans-layout xans-layout-statelogoff">
							<a href="login.do"><span><strong>로그인</strong></span></a>
						</li>
						<li class="xans-element- xans-layout xans-layout-statelogoff">
							<a href="#"><span><strong>회원가입</strong></span></a></li>
						<li class="xans-element- xans-layout xans-layout-statelogoff">
							<a href="#"><span><strong>주문조회</strong></span></a>
						</li>
						<li class="xans-element- xans-layout xans-layout-statelogoff">
							<a href="#"><span><strong>마이페이지</strong></span></a>
						</li>
					</ul>
				</div>
				<ul class="gnb">
					<li class="xan on" style="display: none;">
						<a href="#"><b> BEST <b></b></b></a>
						<div class="sub-category">
							<ul>
								<li><a href="#">all</a></li>
								<li><a href="#">all</a></li>
								<li><a href="#">all</a></li>
								<li><a href="#">all</a></li>
								<li><a href="#">all</a></li>
							</ul>
						</div>
					</li>			
				</ul>
				<div class="section_right">
					<div class="member">
						<div class="util use-top">
							<div class="boardSearch">
								<input type="text" class="boardSearchInput" name="boardSearch" placeholder="Search.." onkeypress="if (event.keyCode == 13) {requestSearch('.util.use-top .boardSearchInput')}">
							</div>
						</div>
						<div class="wishlist">
							<a href="javascript:void(0)"> <i class="lni lni-heart"></i> <span
								class="total-items">0</span>
							</a>
						</div>
						<div class="cart-items">
							<a href="javascript:void(0)" class="main-btn"> <i
								class="lni lni-cart"></i> <span class="total-items">2</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	