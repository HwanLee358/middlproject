package com.wear.order.service;

import java.util.List;
import java.util.Map;

import com.wear.basket.vo.BasketVO;
import com.wear.order.vo.OrderCheckVO;
import com.wear.order.vo.OrderInfoVO;
import com.wear.order.vo.OrderNoVo;
import com.wear.order.vo.OrderVO;
import com.wear.order.vo.SaveOrderVO;

public interface OrderService {
	//전체 구매
	List<OrderVO> selectList(String id);
	//선택 구매
	OrderVO getOrderBasket(OrderVO ov);
	//직접 구매
	OrderVO directList(int productInfoNo);
	//구매 진행
	Boolean addOrder(SaveOrderVO order);
	Boolean OrderInfo(OrderInfoVO orderInfo);
	Boolean remove(BasketVO basket);
	int getProductNo();
	//조회
	List<Map<String, Object>> getOrderNo(OrderNoVo id);
	List<OrderCheckVO> getOrderCheck(OrderNoVo no);
	int getOrderCnt(int productNo);
	int getPageOrderCnt(String id);
}
