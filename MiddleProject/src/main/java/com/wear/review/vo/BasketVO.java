package com.wear.review.vo;

import lombok.Data;

@Data
public class BasketVO {
	private int basketNo;
	private String userId;
	private int productCnt;
	private int productInfoNo;
}
