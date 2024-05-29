package com.wear.wishlist.vo;

import lombok.Data;

@Data
public class WishListVO {
	private int wishlistNo;
	private int productNo;
	private String productName;
	private String productImg;
	private String productSize;
	private String productColor;
	private int productPrice;
	private int productCnt;
	private int deliveryFee;
	private String userId;
}
