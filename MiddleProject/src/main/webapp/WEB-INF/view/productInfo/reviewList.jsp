<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<link href="css/paging.css" rel="stylesheet" />
<link href="css/reviewList.css" rel="stylesheet" />

<div class="review-container" id="reviewTop">
	<div class="review-header">
		<div class="review-title">
			<span class="title-text">리뷰</span><span class="title-count">${totalCnt }</span>
			<span class="review-stars">★★★★★</span>
			<!-- 별 개수 추가 -->
		</div>
	</div>
	<div class="review-images-container">
		<span class="left-arrow" onclick="slideLeft()">&#10094;</span>
		<div class="review-images-wrapper">

			<div class="review-images">
				<c:forEach var="img" items="${totalImg }">
					<img src="images/${img.reviewImg }" class="image-item" />
				</c:forEach>
			</div>
		</div>
		<span class="right-arrow" onclick="slideRight()">&#10095;</span>
	</div>
	<div class="review-content">
		<c:forEach var="review" items="${reviewList }">

			<div class="review-item">
				<div class="review-details">
					<div class="d-flex justify-content-center small text-warning mb-2">
						<c:forEach var="i" begin="1" end="${review.viewScore }">
							<div class="bi-star-fill">★</div>
						</c:forEach>
					</div>
					<span class="review-user">회원ID : ${review.userId }</span> <span
						class="review-date">${review.viewDate }</span>
					<div class="review-text">
						<span>${review.content }</span>
					</div>
				</div>
				<img src="images/${review.reviewImg }"
					class="review-thumb" />
				<!-- 리뷰 썸네일 추가 -->
			</div>
			<!-- 추가적인 리뷰 아이템들 -->
		</c:forEach>
	</div>

	<my:paging pageInfo="${paging }" />

</div>

<script>
<%-- const review = <%= review %>;
console.log(review); --%>
	const reviewImagesWrapper = document
			.querySelector('.review-images-wrapper');
	const reviewImages = document.querySelector('.review-images');
	let scrollAmount = 0;

	function slideLeft() {
		reviewImagesWrapper.scrollTo({
			top : 0,
			left : (scrollAmount -= 200),
			behavior : 'smooth'
		});
	}

	function slideRight() {
		reviewImagesWrapper.scrollTo({
			top : 0,
			left : (scrollAmount += 200),
			behavior : 'smooth'
		});
	}
</script>