package com.wear.order.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.basket.vo.BasketVO;
import com.wear.common.DataSource;
import com.wear.order.mapper.OrderMapper;
import com.wear.order.vo.OrderInfoVO;
import com.wear.order.vo.OrderVO;
import com.wear.order.vo.SaveOrderVO;

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

	@Override
	public Boolean addOrder(SaveOrderVO order) {
		// TODO Auto-generated method stub
		return mapper.insertOrder(order) == 1;
	}

	@Override
	public Boolean remove(BasketVO basket) {
		// TODO Auto-generated method stub
		return mapper.delOrderBasket(basket) == 1;
	}

	@Override
	public int getProductNo() {
		// TODO Auto-generated method stub
		return mapper.getProductNo();
	}

	@Override
	public Boolean OrderInfo(OrderInfoVO orderInfo) {
		// TODO Auto-generated method stub
		return mapper.insertOrderInfo(orderInfo) == 1;
	}	
}
