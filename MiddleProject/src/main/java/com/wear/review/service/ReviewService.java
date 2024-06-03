package com.wear.review.service;

import java.util.List;

import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public interface ReviewService {

	List<ReviewVO> ReviewList(SearchVO search);
	int getReviewCnt(int reviewNo);
	List<ReviewVO> imgList(int pno);
	boolean addReview(ReviewVO rvo);	//리뷰등록
	//리뷰에 들어갈 제품정보 하나 가져오기=> 제품서비스가서
	
	//List<ReviewVO> totalCnt(ReviewVO rvo); //totalCnt[40]
	int totalCnt(ReviewVO rvo);
	
}