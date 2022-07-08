package com.wmk.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderDetailVO {

	private int orderDetailsNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;

}
