package com.wmk.ex.vo;

import java.util.Date;

public class ReviewBoardVO {

	private int rBoardNum;
	private String rId;
	private String rTitle;
	private String rInShort;
	private String rContent;
	private Date rDate;
	private String rOpenTime;
	private String rArea;
	private String rAdress;
	private int rHit;
	private int rStep;
	private int rIndent;
	private int rCategory;
	private int Like_Cnt;

	private String storedFileName;

	public ReviewBoardVO() {

	}

	public int getrBoardNum() {
		return rBoardNum;
	}

	public void setrBoardNum(int rBoardNum) {
		this.rBoardNum = rBoardNum;
	}

	public String getrId() {
		return rId;
	}

	public void setrId(String rId) {
		this.rId = rId;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrInShort() {
		return rInShort;
	}

	public void setrInShort(String rInShort) {
		this.rInShort = rInShort;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrOpenTime() {
		return rOpenTime;
	}

	public void setrOpenTime(String rOpenTime) {
		this.rOpenTime = rOpenTime;
	}

	public String getrArea() {
		return rArea;
	}

	public void setrArea(String rArea) {
		this.rArea = rArea;
	}

	public String getrAdress() {
		return rAdress;
	}

	public void setrAdress(String rAdress) {
		this.rAdress = rAdress;
	}

	public int getrHit() {
		return rHit;
	}

	public void setrHit(int rHit) {
		this.rHit = rHit;
	}

	public int getrStep() {
		return rStep;
	}

	public void setrStep(int rStep) {
		this.rStep = rStep;
	}

	public int getrIndent() {
		return rIndent;
	}

	public void setrIndent(int rIndent) {
		this.rIndent = rIndent;
	}

	public int getrCategory() {
		return rCategory;
	}

	public void setrCategory(int rCategory) {
		this.rCategory = rCategory;
	}

	public int getLike_Cnt() {
		return Like_Cnt;
	}

	public void setLike_Cnt(int like_Cnt) {
		Like_Cnt = like_Cnt;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	@Override
	public String toString() {
		return "RBoardVO [rBoardNum=" + rBoardNum + ", rId=" + rId + ", rTitle=" + rTitle + ", rInShort=" + rInShort
				+ ", rContent=" + rContent + ", rDate=" + rDate + ", rOpenTime=" + rOpenTime + ", rArea=" + rArea
				+ ", rAdress=" + rAdress + ", rHit=" + rHit + ", rStep=" + rStep + ", rIndent=" + rIndent
				+ ", rCategory=" + rCategory + ", Like_Cnt=" + Like_Cnt + ", storedFileName=" + storedFileName + "]";
	}

}
