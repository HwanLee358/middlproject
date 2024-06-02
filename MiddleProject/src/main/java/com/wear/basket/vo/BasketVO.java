package com.wear.basket.vo;

import lombok.Data;

@Data
public class BasketVO {
	private int basketNo;
	private int productInfoNo;
	private int productCnt;
	private String userId;
	private String productImg;
	private String productNo;
	private String productPrice;
	private String productName;
	
	private String productColor;
	private String productSize;
}
