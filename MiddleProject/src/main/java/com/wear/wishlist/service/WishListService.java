package com.wear.wishlist.service;

import java.util.List;

import com.wear.wishlist.vo.WishListVO;

public interface WishListService {
	List<WishListVO> WishList(String userId); // 목록
	boolean removeWishList(int wishlistno);
	
	boolean addWishlist(WishListVO wishlist);
	int wishlistTotalCnt();
}
