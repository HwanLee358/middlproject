package com.wear.order.service;

import java.util.List;

import com.wear.basket.vo.BasketVO;
import com.wear.order.vo.OrderVO;
import com.wear.order.vo.SaveOrderVO;

public interface OrderService {
	List<OrderVO> selectList(String id);
	
	List<OrderVO> directList(int productInfoNo);
	Boolean addOrder(SaveOrderVO order);
	Boolean remove(BasketVO basket);
}
