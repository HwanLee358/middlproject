package com.wear.wishlist.mapper;

import java.util.List;

import com.wear.wishlist.vo.WishListVO;
import com.wear.wishlist.vo.WishVO;

public interface WishListMapper {
	List<WishListVO> selectwishlist(String userId);
	int deletewishList(int wishlistno);
	
	int insertWishlist(WishListVO wishlist);
	int getSelectWish(WishListVO wishlist);
	List<WishVO> sWishList(int productNo);
}
