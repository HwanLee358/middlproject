package com.wear.order.service;

import java.util.List;

import com.wear.order.vo.OrderVO;

public interface OrderService {
	List<OrderVO> selectList(String id);
}
