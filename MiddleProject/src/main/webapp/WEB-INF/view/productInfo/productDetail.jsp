<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/productDetail.css" rel="stylesheet" />
<div class="detail-container">
	<!-- Main Product Image -->

	<div class="main-product-image">
		<img src="images/wear/${result.productImg}.jpg" alt="벨르바스락자켓 이미지" />
	</div>
	<div class="product-summary">
		<h1 class="product-title">${result.productName }</h1>
		<div class="product-info">
			<span class="product-highlight">*주문폭주*</span> <span
				class="product-description">간절기 필수 아우터 ! 단독 셔츠느낌으로도 활용해보세요</span>
			<div class="product-pricing">
				<span class="price-label">판매가</span> 
				<span class="price">${result.productPrice }</span>
			</div>
		</div>
		<div class="product-options">
			<label for="color-select">color</label> <select id="color-select">
				<option value="">[필수] 옵션을 선택해 주세요</option>
				<option value="black">Black</option>
				<option value="white">White</option>
				<option value="mint">Mint</option>
			</select> <label for="color-select">size</label> <select id="size-select">
				<option value="">[필수] 옵션을 선택해 주세요</option>
				<option value="free">Free</option>
			</select>
		</div>
		<div class="selected-options">
			<!-- Selected options will be dynamically added here -->
		</div>

		<div class="product-total">
			<div class="total">TOTAL : 0 (0개)</div>

		</div>
		<div class="product-actions">
			<button class="add-to-cart">ADD TO CART</button>
			<button class="wish-list">WISH LIST</button>
			<button class="buy-now">BUY NOW</button>
		</div>
	</div>

	<a id="detail"></a>

	<!-- Detailed Product Image -->
	<div class="detailed-product-image">
		<img src="images/wear/${result.productImg}.jpg" alt="벨르바스락자켓 상세 이미지" />
	</div>
<!-- 탭 메뉴 -->
<div class="detail-tab-wrap">
	<ul class="detail-tab">
		<li class="tab-item"><a href="#detail">상품상세정보</a></li>
		<li class="tab-item"><a href="#review">사용후기</a></li>
		<li class="tab-item"><a href="#qna">상품Q&A</a></li>
	</ul>
</div>

    <!-- reviewList.jsp가져와서 붙이기 -->
    <jsp:include page="reviewList.jsp" />
	
	<button id="myBtn">리뷰 작성</button>
	
</div>

<!-- 여기부터 모달 -->
<div class="product-actions">
</div>
<a id="review"></a>

<div id="myModal" class="modal">

	<div class="modal-content">
		<span class="close">&times;</span>
		<h2>리뷰 작성</h2>
		<div>
			<img src="resources/images/v4_7.png" alt="Product Image"
				style="width: 100px; height: 100px;"> <span>벨르바스락자켓</span>
		</div>
		<hr>
		<div>
			<label>상품은 어떠셨나요? 별점을 매겨주세요</label>
			<div class="rating">
				<span data-value="1">&#9733;</span> <span data-value="2">&#9733;</span>
				<span data-value="3">&#9733;</span> <span data-value="4">&#9733;</span>
				<span data-value="5">&#9733;</span>
			</div>
		</div>
		<hr>
		<div class="image-upload">
			<input type="file" id="file-input"> <label for="file-input">
				<div id="file-label">+</div>
			</label>
		</div>
		<div>
			<p style="color: red;">최소 15자 이상 입력해 주세요</p>
		</div>
		<textarea placeholder="최소 15자 이상 작성해주세요."
			style="width: 100%; height: 100px;">
    </textarea>
		<div class="submit">등록하기</div>
	</div>

</div>
<script >
const price = ${result.productPrice }
</script>
<script src="js/productDetail.js">
</script>
    
    
    
    
    