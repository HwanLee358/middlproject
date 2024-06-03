package com.wear.order.vo;

import lombok.Data;

@Data
public class SaveOrderVO {
	private int orderNo;
	private String userId;
	private String userName;
	private String productDate;
	private String userPhone;
	private String userEmail;
	private String address1;
	private String address2;
	private String address3;
	private String address4;
	private String orderState;
}
