package com.wear.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	//주문
	private String productName;
	private String productPrice;
	private String productColor;
	private String productSize;
	private int productCnt;
}
