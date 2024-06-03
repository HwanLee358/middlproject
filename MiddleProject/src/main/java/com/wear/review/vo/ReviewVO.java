package com.wear.review.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int viewNo;
	private int productNo;
	private String userId;
	private int viewLikeCnt;
	private int viewScore;
	private String content;
	private String viewDate;
	private String reviewImg;
	
}
