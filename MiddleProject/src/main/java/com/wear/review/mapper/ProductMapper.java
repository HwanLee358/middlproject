package com.wear.review.mapper;

import java.util.List;

import com.wear.member.vo.MemberVo;
import com.wear.review.vo.BasketVO;
import com.wear.review.vo.ProductInfoVO;
import com.wear.review.vo.ProductVO;
import com.wear.wishlist.vo.WishVO;

public interface ProductMapper {
	ProductVO productList(int productNo);

	ProductInfoVO productOption(ProductInfoVO pvo); // 옵션번호 가져오기

	// 장바구니 데이터 생성.
	int insertBasket(BasketVO bvo);
	// 위시리스트 데이터 추가
	int insertWish(WishVO wvo);
	
	//멤버리스트 불러오기
	List<MemberVo> memberList();
	
	//멤버삭제
	boolean deleteMember(MemberVo mvo);
	
}
