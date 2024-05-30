package com.wear.wishlist.vo;

import lombok.Data;

@Data
public class WishListVO {
	private int wishlistNo;
	private int productNo;
	private String userId;
	private String productImg;
	private String productName;
	private String productPrice;
}
