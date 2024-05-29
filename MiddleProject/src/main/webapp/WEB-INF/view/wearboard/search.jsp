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




.xans-search-form .searchbox fieldset {
    width: 530px;
    margin: 0 auto;
}
img, fieldset {
    border: none;
    vertical-align: top;
}
legend {
    visibility: hidden;
    position: absolute;
    left: -9999px;
    top: -9999px;
    width: 0;
    height: 0;
    line-height: 0;
}
.xans-search-form .searchbox .item {
    padding: 4px 0;
    margin: 0;
    color: #353535;
    line-height: 20px;
}
.xans-search-form .searchbox .item strong {
    color: #222;
    font-size: 14px;
    font-weight: normal;
    line-height: 32px;
    padding: 0 30px 0 0;
    box-sizing: Border-box;
    width: 120px;
    float: left;
    text-align: right;
}
.xans-search-form .searchbox #category_no, .xans-search-form .searchbox #order_by {
    width: 400px;
}
.xans-search-form .searchbox .item select, .xans-search-form .searchbox .item input {
    height: 34px;
    box-sizing: border-box;
}
select{
	border: 1px solid #d5d5d5;
}
.xans-search-form .searchbox #keyword {
    width: 260px;
}
input[type=text], input[type=password] {
    height: 18px;
    line-height: 20px;
    padding: 2px 4px;
    border: 1px solid #d5d5d5;
    color: #353535;
    font-size: 12px;
}
.xans-search-form .searchbox #productPrice1 {
    width: 130px;
}
.xans-search-form .searchbox #productPrice2 {
    width: 130px;
}
.xans-search-form .searchbox .button {
    margin: 30px auto 0;
    width: 158px;
}
.xans-search-form .searchbox .button input {
    background: #222;
    width: 158px;
    height: 45px;
    line-height: 43px;
    text-align: center;
    color: #fff;
    font-size: 14px;
    border: 1px solid #222;
    font-family: NanumGothic, sans-serif;
    cursor: pointer;
}
input, select, textarea {
    vertical-align: middle;
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
		<!-- search -->
		<form id="searchForm" action="search.do" method="get">
			<div class="xans-element- xans-search xans-search-form ">
				<div class="ec-base-box searchbox">
					<fieldset>
						<legend>상품검색</legend>
						<div class="item">
							<strong>상품분류</strong>
							<select id="category_no" name="category_no">
								<option value="" selected="selected">상품분류 검색</option>
								<c:forEach var="Option" items="${cateOption }">
									<option value="${Option.categoryNo }">
										${Option.categoryName }
									</option>								
								</c:forEach>
							</select>
						</div>
						<div class="item">
							<strong>검색명</strong>
							<input type="text" id="keyword" name="keyword" size="15" value="${keyword }">
						</div>
						<div class="item">
							<strong>가격대</strong>
							<input type="text" id="productPrice1" name="productPrice1" value="${inputPrice1 }">~
							<input type="text" id="productPrice2" name="productPrice2" value="${inputPrice2 }">							
						</div>
						<p class="button">
							<input type="submit" value="SEARCH">
						</p>
					</fieldset>	
				</div>
				<div class="searchResult">
					<p class="record">총<strong> ${searchCnt }</strong>개의 상품이 검색되었습니다</p>
				</div>			
			</div>
		</form>
		<!-- search board -->
		<div class="xans-element- xans-search xans-search-result ec-base-product">
			<ul class="prdList grid3">
					<c:forEach var="search" items="${searchBoard }">
					<li class="xans-record-">
						<div class="thumbnail">
							<div class="prdlmg">
								<a href="productDetail.do?pno=${search.productNo }" name=""><img src="images/wear/${search.productImg }.webp" id="" alt=""></a>
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