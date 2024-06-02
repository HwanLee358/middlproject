package com.wear.order.mapper;

import java.util.List;
import java.util.Map;

import com.wear.basket.vo.BasketVO;
import com.wear.order.vo.OrderCheckVO;
import com.wear.order.vo.OrderInfoVO;
import com.wear.order.vo.OrderNoVo;
import com.wear.order.vo.OrderVO;
import com.wear.order.vo.SaveOrderVO;

public interface OrderMapper {
	//전체 구매
	List<OrderVO> selectList(String id);
	//직접 구매
	OrderVO directOrder(int productInfo);
	
	//구매
	int getProductNo();
	int insertOrder(SaveOrderVO order);
	int delOrderBasket(BasketVO basket);
	int insertOrderInfo(OrderInfoVO orderInfo);
	
	//조회
	List<Map<String, Object>> getOrderNo(String id);
	List<OrderCheckVO> getOrderCheck(OrderNoVo no);
	int getOrderCount(int productNo);
}
