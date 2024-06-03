package com.wear.wishlist.service;

import java.util.List;

import com.wear.wishlist.vo.WishListVO;
import com.wear.wishlist.vo.WishVO;

public interface WishListService {
	List<WishListVO> WishList(String userId); // 목록
	boolean removeWishList(int wishlistno);
	
	boolean addWishlist(WishListVO wishlist);
	int wishlistTotalCnt();
	int getSelectWish(WishListVO wishlist);
	List<WishVO> selectWishList(int productNo);
}
