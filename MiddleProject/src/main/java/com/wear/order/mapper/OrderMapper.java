package com.wear.order.mapper;

import java.util.List;

import com.wear.order.vo.OrderVO;

public interface OrderMapper {
	//전체 구매
	List<OrderVO> selectList(String id);
	//직접 구매
	List<OrderVO> directOrder(int productInfo);
}
