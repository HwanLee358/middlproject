package com.wear.basket.mapper;

import java.util.List;

import com.wear.basket.vo.BasVO;
import com.wear.basket.vo.BasketVO;

public interface BasketMapper {
	// 중간프로젝트
		List<BasketVO> basketselectList(String userId);
		int updateBasket(BasketVO bvo);
		int deleteBasket(int basketno);
		
		int insertBasket(BasketVO basket);

		// basket cnt
		int basketCnt();
		int wishlistCnt();
		
		int orderbasket(BasketVO basket);
		
		List<BasketVO> wishtobasket(int productNo);
		
}
