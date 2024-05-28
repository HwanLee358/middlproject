package com.wear.wishlist.service;

import java.util.List;

import com.wear.wishlist.vo.WishListVO;

public interface WishListService {
	List<WishListVO> WishList(); // 목록
	boolean removeWishList(int wishlistno);
}
