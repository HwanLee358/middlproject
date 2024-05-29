package com.wear.order.mapper;

import java.util.List;

import com.wear.order.vo.OrderVO;

public interface OrderMapper {
	List<OrderVO> selectList(String id);
}
