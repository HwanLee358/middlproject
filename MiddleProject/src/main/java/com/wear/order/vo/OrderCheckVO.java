package com.wear.order.vo;

import lombok.Data;

@Data
public class OrderCheckVO {
	private String productNo;
	private String orderNo;
	private String productDate;
	
	private String productName; 
	private String productImg;
	
	private String productColor;
	private String productSize;
	
	private int productCnt;
	private int productPrice;
	
	private String address1;
	private String address2;
	private String address3;
	private String address4;
}
