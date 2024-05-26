package com.wear.review.service;

import java.util.List;

import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public interface ReviewService {

	List<ReviewVO> ReviewList(SearchVO search);
	int getReviewCnt(int reviewNo);
	List<ReviewVO> imgList(ReviewVO rvo);
	List<ReviewVO> totalCnt(ReviewVO rvo);
	boolean addReview(ReviewVO review);
	
}