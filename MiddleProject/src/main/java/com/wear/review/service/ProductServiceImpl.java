package com.wear.review.service;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.review.mapper.ProductMapper;
import com.wear.review.vo.ProductVO;

public class ProductServiceImpl implements ProductService {
	// 주소패킹
	SqlSession session = DataSource.getInstance().openSession(true);
	// 인터페이스
	ProductMapper mapper = session.getMapper(ProductMapper.class);
	
	@Override
	public ProductVO productList(int proNo) {
		return mapper.productList(proNo);
	}
	
}