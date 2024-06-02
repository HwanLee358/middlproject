package com.wear.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	//주문
	private String productName;
	private int productPrice;
	private String productColor;
	private String productSize;
	private int productCnt;
	
	private int productInfoNo;
	private int basketNo;
	private String userId;
}
