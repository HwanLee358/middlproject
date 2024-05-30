package com.wear.basket.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.basket.mapper.BasketMapper;
import com.wear.basket.vo.BasVO;
import com.wear.basket.vo.BasketVO;
import com.wear.common.DataSource;

public class BasketServiceImpl implements BasketService {
	SqlSession session = DataSource.getInstance().openSession(true);
	BasketMapper mapper = session.getMapper(BasketMapper.class);
	
	@Override
	public List<BasketVO> basketList(String userId) {
		// TODO Auto-generated method stub
		return mapper.basketselectList(userId);
	}

	@Override
	public boolean modifyBasket(BasketVO bvo) {
		// TODO Auto-generated method stub
		return mapper.updateBasket(bvo) == 1;
	}

	@Override
	public boolean removeBasket(int basketno) {
		// TODO Auto-generated method stub
		return mapper.deleteBasket(basketno) == 1;
	}

	
	
	
	// basketCnt
	@Override
	public int basketTotalCnt() {
		// TODO Auto-generated method stub
		return mapper.basketCnt();
	}

	@Override
	public boolean addBasket(BasketVO basket) {
		// TODO Auto-generated method stub
		return mapper.insertBasket(basket) == 1;
	}

	@Override
	public boolean orderbasket(BasketVO basket) {
		// TODO Auto-generated method stub
		return mapper.orderbasket(basket) == 1;
	}

	@Override
	public List<BasVO> selectbasket(int productNo) {
		// TODO Auto-generated method stub
		return mapper.sBasket(productNo);
	}





}
