package com.wear.wishlist.mapper;

import java.util.List;

import com.wear.wishlist.vo.WishListVO;

public interface WishListMapper {
	List<WishListVO> selectwishlist();
	int deletewishList(int wishlistno);
}
