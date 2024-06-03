package com.wear.basket.service;

import java.util.List;

import com.wear.basket.vo.BasVO;
import com.wear.basket.vo.BasketVO;

public interface BasketService {
	// 중간프로젝트 장바구니
		List<BasketVO> basketList(String userId); // 목록
		boolean modifyBasket(BasketVO bvo);
		boolean removeBasket(int basketno);
		
		boolean addBasket(BasketVO basket);
		
		
		// basketCnt
		int basketTotalCnt();
		
		// orderbasket
		boolean orderbasket(BasketVO basket);
		
		List<BasketVO> selectbasket(int productNo);
}
