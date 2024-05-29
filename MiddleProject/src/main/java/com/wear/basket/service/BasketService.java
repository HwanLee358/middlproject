package com.wear.basket.service;

import java.util.List;

import com.wear.basket.vo.BasketVO;

public interface BasketService {
	// 중간프로젝트 장바구니
		List<BasketVO> basketList(); // 목록
		boolean modifyBasket(BasketVO bvo);
		boolean removeBasket(int basketno);
		
		
		
		// basketCnt
		int basketTotalCnt();
}
