<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>	
<link href="css/wearList.css" rel="stylesheet" />
<div class="contents wide">
	<div class="xans-product-menupackage">
		<div class="xans-product-headcategory title">
			<p class="banner"></p>
			<!-- main -->
			<h2>
				<span>Recent</span>
			</h2>
			<!-- sub -->
		</div>
	</div>
	<div class="list_normal">
		<div class="ec-base-product">
			<ul class="prdList grid4">
				<c:forEach var="List" items="${wearList }" begin="1" end="8">
					<li id="" class="xans-recode-">
						<div class="thumbnail">
							<div class="prdlmg">
								<a href="productDetail.do?pno=${List.productNo }"><img
									src="images/wear/${List.productImg }.webp" id="" alt=""></a>
							</div>
							<div class="icon">
								<div class="button">
									<span data-product_no="${List.productNo }"> <img
										src="images/icon_202204071148303300.png"
										class="icon_img ec-product-listwishicon"
										alt="${List.productImg }" onclick='insertWishList()'>
									</span> <span data-product_no="${List.productNo }"> <img
										src="images/icon_202204071148220700.png"
										class="ec-admin-icon cart">
									</span>
								</div>
							</div>
						</div>
						<div class="description">
							<strong class="name"> <a
								href="productDetail.do?pno=${List.productNo }"> <span
									class="title displaynone"></span> <b> <span
										style="font-size: 12px; color: #555555;">${List.productName }</span><b></b>
								</b>
							</a>
							</strong>
							<ul class="xans-element- xans-product xans-product-listitem spec">
								<li class="xans-record-"><span
									style="font-size: 12px; color: #000000; font-weight: bold;">
										<fmt:formatNumber>${List.productPrice }</fmt:formatNumber>
								</span></li>
								<li class="xans-record-"><strong class="title"> <span
										style="font-size: 10px; color: #333333; font-weight: bold;">리뷰</span>
										:
								</strong> <span
									style="font-size: 10px; color: #333333; font-weight: bold;">1</span>
								</li>
							</ul>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="xans-product-menupackage">
		<div class="xans-product-headcategory title">
			<p class="banner"></p>
			<!-- main -->
			<h2>
				<span>Best</span>
			</h2>
			<!-- sub -->
		</div>
	</div>
</div>