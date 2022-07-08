package com.wmk.ex.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderListVO {

	// OrderVO
	private String orderId;
	private String userId;
	private String OrderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date oderDate;

	// OrderDetilsVO
	private int orderDetailsNum;
	private int gdsNum;
	private int cartStock;

	// GoodsVO
	private String gdsName;
	private String gdsImg;
	private int gdsPrice;

}
