package com.wear.basket.mapper;

import java.util.List;

import com.wear.basket.vo.BasketVO;

public interface BasketMapper {
	// 중간프로젝트
		List<BasketVO> basketselectList();
		int updateBasket(BasketVO bvo);
		int deleteBasket(int basketno);
}
