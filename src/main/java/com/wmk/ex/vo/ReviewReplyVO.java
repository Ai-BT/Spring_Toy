package com.wmk.ex.vo;

import java.util.Date;

public class ReviewReplyVO {

	private int rBoardNum;
	private String id;
	private int repNum;
	private String repCon;
	private Date repDate;

	public ReviewReplyVO() {

	}

	public int getrBoardNum() {
		return rBoardNum;
	}

	public void setrBoardNum(int rBoardNum) {
		this.rBoardNum = rBoardNum;
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
