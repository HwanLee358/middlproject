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
			<span class="product-highlight">*주문폭주*</span>
			<span class="product-description">간절기 필수 아우터 ! 단독 셔츠느낌으로도 활용해보세요</span>
			<div class="product-pricing">
				<span class="price-label">판매가</span>
				<span class="price">${result.productPrice } 원</span>
			</div>
		</div>
		<div class="product-options">
			<label for="color-select">color</label>
			<select id="color-select">
				<option value="">[필수] 옵션을 선택해 주세요</option>
				<option value="Red">Red</option>
				<option value="Green">Green</option>
				<option value="Blue">Blue</option>
			</select>
			<label for="color-select">size</label>
			<select id="size-select">
				<option value="">[필수] 옵션을 선택해 주세요</option>
				<option value="Large">Large</option>
				<option value="Medium">Medium</option>
				<option value="Small">Small</option>
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
	<a id="review"></a>
	<jsp:include page="reviewList.jsp" />
	
	<button id="myBtn">리뷰 작성</button>
	

</div>

<!-- 여기부터 모달 -->
<div class="product-actions">
</div>


<form action="reviewWrite.do" enctype="multipart/form-data" method="post" name="reviewFrm">
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>리뷰 작성</h2>
			<div>
				<img src="images/wear/${result.productImg }.jpg" alt="Product Image" style="width: 100px; height: 100px;">
				<span>${result.productName }</span>
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
				<input type="file" id="file-input" name="review-img">
				<label for="file-input">
					<div id="file-label">+</div>
				</label>
			</div>
			<div>
				<p style="color: red;">최소 15자 이상 입력해 주세요</p>
			</div>
			<textarea placeholder="최소 15자 이상 작성해주세요." style="width: 100%; height: 100px;" name="content"></textarea>
			<div class="submit"><button type="submit">등록하기</button></div>
		</div>
	</div>
</form>


<script>
	const price = "${result.productPrice }";
	const productNo = "${result.productNo }";
	console.log('productNo,,,,', productNo)
	const userId = '${logId}';
</script>
<script src="js/productDetail.js"></script>


<!-- QnA -->
<link href="css/qnaboard.css" rel="stylesheet" />
<link href="css/wearList.css" rel="stylesheet" />
<a id="qna"></a>
<div class="detailQnaList">
	<div class="wrapper">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2>
					<span>Q&A</span>
				</h2>
				<!-- sub -->
				<span>상품에 대해 궁금한 점을 해결해 드립니다</span>
			</div>
		</div>
		<div class="table-slide qna-list">
			<table>
				<caption>QnA 리스트</caption>
				<colgroup>
					<col width="80">
					<col width="30">
					<col width="*">
					<col width="100">
					<col width="100">
					<col width="80">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">
							<div class="tb-center">NO</div>
						</th>
						<th scope="col"></th>
						<th scope="col">
							<div class="tb-center">SUBJECT</div>
						</th>
						<th scope="col">
							<div class="tb-center">NAME</div>
						</th>
						<th scope="col">
							<div class="tb-center">DATE</div>
						</th>
						<th scope="col">
							<div class="tb-center">HIT</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr class="nbg" style="display:none">
						<td>
							<div class="tb-center"><span class="reviewnum">252</span></div>
						</td>
						<td>
							<div class="tb-center"><span class="reviewnum"></span></div>
						</td>
						<td>
							<div class="tb-center"><span class="reviewnum"><a href="#">상품문의</a></span></div>
						</td>
						<td>
							<div class="tb-center"><span class="reviewnum">이름</span></div>
						</td>
						<td>
							<div class="tb-center"><span class="reviewnum">날짜</span></div>
						</td>
						<td>
							<div class="tb-center"><span class="reviewnum">조회수</span></div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="list-btm">
				<div class="paging-wrap">
					<div class="paging">
						<a href="" class="prev"></a>
						<a href="" class="now">1 </a>
						<a href="">2</a>
						<a href="">3</a>
						<a href="">4</a>
						<a href="">5</a>
						<a href="" class="next">></a>
					</div>
				</div>
				<div class="btm_write">
					<c:choose>
						<c:when test="${empty logId}">
							<a href="logForm.do">문의하기</a>
						</c:when>
						<c:otherwise>
							<a href="qnaWriteForm.do?pno=${result.productNo }">문의하기</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	const qnaNo = "${result.productNo }"
</script>
<script src="js/qnalist.js"></script>