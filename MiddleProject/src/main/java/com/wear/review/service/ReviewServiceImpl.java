package com.wear.review.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.review.mapper.ReviewMapper;
import com.wear.review.vo.ReviewVO;
import com.wear.review.vo.SearchVO;

public class ReviewServiceImpl implements ReviewService {
	// 주소패킹
	SqlSession session = DataSource.getInstance().openSession(true);
	// 인터페이스
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);

	@Override
	public List<ReviewVO> ReviewList(SearchVO search) {
		return mapper.reviewListPaging(search);
	}

	@Override
	public int getReviewCnt(int reviewNo) {
		return mapper.getReviewTotalCnt(reviewNo);
	}

	@Override
	public List<ReviewVO> imgList(ReviewVO rvo) {
		return mapper.totalImg();
	}

	@Override
	public List<ReviewVO> totalCnt(ReviewVO rvo) {
		return mapper.getCnt();
	}

	@Override
	public boolean addReview(ReviewVO review) {
		return mapper.insertReview(review)==1;
	}



}
