package com.wear.order.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.order.mapper.OrderMapper;
import com.wear.order.vo.OrderVO;

public class OrderServiceImpl implements OrderService{
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	
	@Override
	public List<OrderVO> selectList(String id) {
		// TODO Auto-generated method stub
		return mapper.selectList(id);
	}

	@Override
	public List<OrderVO> directList(int productInfoNo) {
		// TODO Auto-generated method stub
		return mapper.directOrder(productInfoNo);
	}	
}
