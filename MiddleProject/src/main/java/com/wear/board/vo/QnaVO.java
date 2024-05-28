package com.wear.board.vo;

import lombok.Data;

@Data
public class QnaVO {
	private int postNo;
	private String userId;
	private int product_no;
	private String postTitle;
	private String content;
	private int views;
}
