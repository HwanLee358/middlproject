package com.wear.review.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.member.vo.MemberVo;
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
	public List<MemberVo> getMemberList() {
		return mapper.memberList();
	}


	@Override
	public boolean removeMember(MemberVo mvo) {
		return mapper.deleteMember(mvo);
	}



}