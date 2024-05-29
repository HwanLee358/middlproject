package com.wear.wishlist.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wear.common.DataSource;
import com.wear.wishlist.mapper.WishListMapper;
import com.wear.wishlist.vo.WishListVO;

public class WishListServiceImpl implements WishListService{
	SqlSession session = DataSource.getInstance().openSession(true);
	WishListMapper mapper = session.getMapper(WishListMapper.class);
	@Override
	public List<WishListVO> WishList() {
		// TODO Auto-generated method stub
		return mapper.selectwishlist();
	}
	@Override
	public boolean removeWishList(int wishlistno) {
		// TODO Auto-generated method stub
		return mapper.deletewishList(wishlistno) == 1;
	}
}
