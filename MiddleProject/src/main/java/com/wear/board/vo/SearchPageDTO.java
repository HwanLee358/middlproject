package com.wear.board.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SearchPageDTO {
	private int page;
	private int startPage, endPage;
	private boolean prev, next;
	
	public SearchPageDTO(int page, int totalCnt) {
		this.page = page;
		int readlEnd = (int) Math.ceil(totalCnt / 6.0);
		
		this.endPage = (int) Math.ceil(page / 6.0) * 5;
		this.startPage = this.endPage - 4;
		this.endPage = this.endPage > readlEnd ? readlEnd : this.endPage;
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < readlEnd ? true : false;
	}
}
