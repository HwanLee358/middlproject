package com.wear.wishlist.mapper;

import java.util.List;

import com.wear.wishlist.vo.WishListVO;

public interface WishListMapper {
	List<WishListVO> selectwishlist(String userId);
	int deletewishList(int wishlistno);
	
	int insertWishlist(WishListVO wishlist);
}
