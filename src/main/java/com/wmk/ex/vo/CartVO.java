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
public class CartVO {

	private int cartNum;
	private String userId;
	private int gdsNum;
	private String gdsColor;
	private String gdsSize;
	private String gdsText;
	private int cartStock;
	private Date addDate;

}
