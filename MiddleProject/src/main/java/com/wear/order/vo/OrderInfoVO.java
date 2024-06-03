package com.wear.order.vo;

import lombok.Data;

@Data
public class OrderInfoVO {
	private int orderInfoNo;
	private int orderNo;
	private int productInfoNo;
	private int productCnt;
	private int productPrice;
}
