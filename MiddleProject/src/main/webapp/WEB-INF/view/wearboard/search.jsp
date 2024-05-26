<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<link href="css/wearList.css" rel="stylesheet" />
<style>
.xans-search-form .searchbox {
    background: none;
    padding: 50px 0;
    border: 1px solid #ddd;
    width: 1200px;
    margin: 21px auto 60px;
    box-sizing: border-box;
}
.xans-search-form .searchResult {
    margin: 0 15px 50px;
    border: 0;
    border-bottom: 1px solid #ddd;
    overflow: hidden;
    text-align: right;
    line-height: 38px;
}
.xans-search-form .searchResult .record {
    color: #222;
    float: left;
    padding: 0 0 0 8px;
}
</style>
	<div class="contents wide">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2><span>PRODUCT SEARCH</span></h2>
				<!-- sub -->
			</div>
		</div>
		<form id="">
			<div class="xans-element- xans-search xans-search-form ">
				<div class="ec-base-box searchbox">
					
				</div>
				<div class="searchResult">
					<p class="record">총<strong> ${searchCnt }</strong>개의 상품이 검색되었습니다</p>
				</div>			
			</div>
		</form>
		<div class="xans-element- xans-search xans-search-result ec-base-product">
			<ul class="prdList grid3">
					<c:forEach var="search" items="${searchBoard }">
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
										<span style="font-size:12px;color:#555555;">${search.productName }</span><b></b>
									</b>
								</a>
							</strong>
							<ul class="xans-element- xans-product xans-product-listitem spec">
								<li class="xans-record-">
									<span style="font-size:12px;color:#000000;font-weight:bold;">
									<fmt:formatNumber>${search.productPrice }</fmt:formatNumber> 
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
		<!-- paging -->
		<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
			<c:if test="${searchPaging.prev }">
			<a href="#" class="first">
				<img src="images/btn_page_prev.png" />
			</a>
			</c:if>
			<ol>
				<c:forEach var="p" begin="${searchPaging.startPage }" end="${searchPaging.endPage }">
				<li class="xans-record-">				
					<a href="search.do?keyword=${keyword }&page=${p }" class="${p == searchPaging.page ? 'this' : 'other' }">${p }</a>
				</li>
				</c:forEach>
			</ol>
			<c:if test="${searchPaging.next }">
			<a href="#" class="last" style="center">
				<img src="images/btn_page_next.png" />
			</a>
			</c:if>
		</div>
	</div>