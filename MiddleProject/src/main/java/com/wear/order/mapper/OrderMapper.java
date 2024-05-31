package com.wear.order.mapper;

import java.util.List;

import com.wear.basket.vo.BasketVO;
import com.wear.order.vo.OrderInfoVO;
import com.wear.order.vo.OrderVO;
import com.wear.order.vo.SaveOrderVO;

public interface OrderMapper {
	//전체 구매
	List<OrderVO> selectList(String id);
	//직접 구매
	List<OrderVO> directOrder(int productInfo);
	
	int getProductNo();
	int insertOrder(SaveOrderVO order);
	int delOrderBasket(BasketVO basket);
	int insertOrderInfo(OrderInfoVO orderInfo);
}
