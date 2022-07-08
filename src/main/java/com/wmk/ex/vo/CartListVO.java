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
public class CartListVO {

	private int cartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	private int num;
	private String gdsName;
	private int gdsPrice;
	private String gdsImg;

	private String gdsColor;
	private String gdsSize;
	private String gdsText;

}
