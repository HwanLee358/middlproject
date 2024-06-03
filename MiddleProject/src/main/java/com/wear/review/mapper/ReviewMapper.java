package com.wear.review.mapper;

import java.util.List;

import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(int proNo);
	List<ReviewVO> reviewListPaging(SearchVO search);
	int getReviewTotalCnt(int productNo);
	List<ReviewVO> totalImg(int pno);
	int getCnt(ReviewVO rvo);	//totalCnt[40]
	int insertReview(ReviewVO review);
	
	
}
