package com.wear.review.service;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.review.mapper.ProductMapper;
import com.wear.review.vo.BasketVO;
import com.wear.review.vo.ProductInfoVO;
import com.wear.review.vo.ProductVO;
import com.wear.wishlist.vo.WishVO;

public class ProductServiceImpl implements ProductService {
	// 주소패킹
	SqlSession session = DataSource.getInstance().openSession(true);
	// 인터페이스
	ProductMapper mapper = session.getMapper(ProductMapper.class);

	@Override
	public ProductVO getProduct(int proNo) {
		return mapper.productList(proNo);
	}

	@Override
	public ProductInfoVO getProductInfoNo(ProductInfoVO pvo) {
		return mapper.productOption(pvo);
	}

	@Override
	public boolean addBasket(BasketVO bvo) {
		return mapper.insertBasket(bvo) == 1;
	}

	@Override
	public boolean addWish(WishVO wvo) {
		return mapper.insertWish(wvo) == 1;
	}

	@Override
	public int getBasket(BasketVO gb) {
		// TODO Auto-generated method stub
		return mapper.getBasket(gb);
	}

}