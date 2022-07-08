package com.wmk.ex.vo;

import java.util.Date;

public class FreeReplyListVO {

	private int fBoard_Num;
	private String id;
	private int repNum;
	private String repCon;
	private Date repDate;

	public FreeReplyListVO() {

	}

	public int getfBoard_Num() {
		return fBoard_Num;
	}

	public void setfBoard_Num(int fBoard_Num) {
		this.fBoard_Num = fBoard_Num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRepNum() {
		return repNum;
	}

	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}

	public String getRepCon() {
		return repCon;
	}

	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

}
