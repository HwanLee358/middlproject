package com.wear.wishlist.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.wishlist.mapper.WishListMapper;
import com.wear.wishlist.vo.WishListVO;
import com.wear.wishlist.vo.WishVO;

public class WishListServiceImpl implements WishListService{
	SqlSession session = DataSource.getInstance().openSession(true);
	WishListMapper mapper = session.getMapper(WishListMapper.class);
	@Override
	public List<WishListVO> WishList(String userId) {
		// TODO Auto-generated method stub
		return mapper.selectwishlist(userId);
	}
	@Override
	public boolean removeWishList(int wishlistno) {
		// TODO Auto-generated method stub
		return mapper.deletewishList(wishlistno) == 1;
	}
	@Override
	public int wishlistTotalCnt() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public boolean addWishlist(WishListVO wishlist) {
		// TODO Auto-generated method stub
		return mapper.insertWishlist(wishlist) == 1;
	}
	
	@Override
	public List<WishVO> selectWishList(int productNo) {
		// TODO Auto-generated method stub
		return mapper.sWishList(productNo);
	}
}
