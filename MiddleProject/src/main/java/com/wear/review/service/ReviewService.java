package com.wear.review.service;

import java.util.List;

import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public interface ReviewService {

	List<ReviewVO> ReviewList(SearchVO search);
	int getReviewCnt(int reviewNo);
	List<ReviewVO> imgList(int pno);
	boolean addReview(ReviewVO review);
	//List<ReviewVO> totalCnt(ReviewVO rvo); //totalCnt[40]
	int totalCnt(ReviewVO rvo);
	
}