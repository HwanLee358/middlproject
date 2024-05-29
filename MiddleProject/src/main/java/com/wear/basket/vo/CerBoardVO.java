package com.wear.basket.vo;

import lombok.Data;

@Data
public class CerBoardVO {
	private int cancel_echange_returnNo;
	private int orderNo;
	private String orderState;
	private String receiptTitle;
	private String receiptDate;
	private String orderProgress;
	private String completionDate;
}
