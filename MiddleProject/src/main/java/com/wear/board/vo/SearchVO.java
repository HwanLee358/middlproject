package com.wear.board.vo;

import lombok.Data;

@Data
public class SearchVO {
	private int page;
	private int categoryNo;
	private String keyword;
	
	
	// 가격
	private int productPrice1;
	private int productPrice2;
}
