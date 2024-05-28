package com.wear.board.vo;

import lombok.Data;

@Data
public class QnaVO {
	private int postNo;
	private String userId;
	private int productNo;
	private String postTitle;
	private String content;
	private String creationDate;
	private int views;
}
