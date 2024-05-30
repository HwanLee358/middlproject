<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<link href="css/wearList.css" rel="stylesheet" />

<style></style>
	<div class="contents wide">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2><span>
					<c:forEach var="title" items="${titleList }">
						<c:if test="${title.categoryNoRef eq 0}">${title.categoryName }</c:if>
					</c:forEach>
				</span></h2>
				<!-- sub -->
				<ul class="list_cate_sub">					
					<c:forEach var="title" items="${titleList }">
						<li>
							<c:choose>
									<c:when test="${title.categoryNoRef eq 0}">
										<c:if test="${title.categoryName ne 'BEST' && title.categoryName ne 'NEW' }">
											<a href="list.do?cate_no=${title.categoryNo }">
											전체
											</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="list.do?cate_no=${title.categoryNo }&name=${title.categoryName }">
										${title.categoryName }							
										</a>
									</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 추천상품 -->
		<c:if test="${empty categoryName && categoryNo ne 1 && categoryNo ne 2}">
		<div class="xans-element- xans-product xans-product-listrecommend recommend_wrap">
			<div class="ec-base-product">
				<div class="title">
					<h3><span>BEST ITEM</span></h3>
				</div>
				<ul class="prdList grid3">
					<li class="xans-record-">
						<div class="thumbnail">
							<div class="prdlmg">
								<a href="#" name=""><img src="images/리모라운드넥니트.gif" id="" alt=""></a>
							</div>
							<div class="icon">
								<div class="button">
										<span>
											<img src="images/icon_202204071148303300.png" class="icon_img ec-product-listwishicon" alt="">
										</span>
										<span>
											<img src="images/icon_202204071148220700.png" class="ec-admin-icon cart">
										</span>
								</div>									
							</div>
						</div>
						<div class="description">
							<strong class="name">
								<a href="#">
									<span class="title displaynone"></span>
									<b>
										<span style="font-size:12px;color:#555555;">리모라운드넥니트</span><b></b>
									</b>
								</a>
							</strong>
							<ul class="xans-element- xans-product xans-product-listitem spec">
								<li class="xans-record-">
									<span style="font-size:12px;color:#000000;font-weight:bold;">
									<fmt:formatNumber>12900</fmt:formatNumber> 
									</span>
								</li>
								<li class="xans-record-">
									<strong class="title">
										<span style="font-size:10px;color:#333333;font-weight:bold;">리뷰</span> :
									</strong>
									<span style="font-size:10px;color:#333333;font-weight:bold;">1</span>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		</c:if>
		<!-- 일반상품 -->
		<div class="list_normal">
			<div class="ec-base-product">
				<ul class="prdList grid4">
					<c:forEach var="List" items="${wearList }">
					<li id="" class="xans-recode-">
						<div class="thumbnail">
							<div class="prdlmg">
								<a href="productDetail.do?pno=${List.productNo }" name=""><img src="images/wear/${List.productImg }.webp" id="" alt=""></a>
							</div>
							<div class="icon">
								<div class="button">
										<span data-product_no="${List.productNo }">
											<img src="images/icon_202204071148303300.png" class="icon_img ec-product-listwishicon" alt="${List.productImg }" onclick='insertWishList()'>
										</span>
										<span data-product_no="${List.productNo }">
											<img src="images/icon_202204071148220700.png" class="ec-admin-icon cart" >
										</span>
								</div>									
							</div>
						</div>
						<div class="description">
							<strong class="name">
								<a href="productDetail.do?pno=${List.productNo }">
									<span class="title displaynone"></span>
									<b>
										<span style="font-size:12px;color:#555555;">${List.productName }</span><b></b>
									</b>
								</a>
							</strong>
							<ul class="xans-element- xans-product xans-product-listitem spec">
								<li class="xans-record-">
									<span style="font-size:12px;color:#000000;font-weight:bold;">
									<fmt:formatNumber>${List.productPrice }</fmt:formatNumber> 
									</span>
								</li>
								<li class="xans-record-">
									<strong class="title">
										<span style="font-size:10px;color:#333333;font-weight:bold;">리뷰</span> :
									</strong>
									<span style="font-size:10px;color:#333333;font-weight:bold;">1</span>
								</li>
							</ul>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- paging -->
		<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
			<c:if test="${paging.prev }">
			<a href="#" class="first">
				<img src="images/btn_page_prev.png" />
			</a>
			</c:if>
			<ol>
				<c:forEach var="p" begin="${paging.startPage }" end="${paging.endPage }">
				<li class="xans-record-">
					<c:choose>
					<c:when test="${empty categoryName }">
						<a href="list.do?cate_no=${categoryNo }&page=${p }" class="${p == paging.page ? 'this' : 'other' }">${p }</a>
					</c:when>
					<c:otherwise>						
						<a href="list.do?cate_no=${categoryNo }&name=${categoryName }&page=${p }" class="${p == paging.page ? 'this' : 'other' }">${p }</a>
					</c:otherwise>
					</c:choose>
				</li>
				</c:forEach>
			</ol>
			<c:if test="${paging.next }">
			<a href="#" class="last" style="center">
				<img src="images/btn_page_next.png" />
			</a>
			</c:if>
		</div>
	</div>
<script src="js/addBasket.js"></script>
<script src="js/addWishlist.js"></script>