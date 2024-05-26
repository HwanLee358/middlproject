package com.wear.review.mapper;

import java.util.List;

import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList();
	List<ReviewVO> reviewListPaging(SearchVO search);
	int getReviewTotalCnt(int reviewNo);
	List<ReviewVO> totalImg();
	List<ReviewVO> getCnt();
	int insertReview(ReviewVO review);
}
