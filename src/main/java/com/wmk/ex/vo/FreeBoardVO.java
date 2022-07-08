package com.wmk.ex.vo;

import java.util.Date;

public class FreeBoardVO {

	private int fBoard_Num;
	private String fId;
	private String fTitle;
	private String fContent;
	private Date fDate;
	private int fHit;
	private int fGroup;
	private int fStep;
	private int fIndent;

	public FreeBoardVO(int fBoard_Num, String fId, String fTitle, String fContent, Date fDate, int fHit, int fGroup,
			int fStep, int fIndent) {
		this.fBoard_Num = fBoard_Num;
		this.fId = fId;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.fDate = fDate;
		this.fHit = fHit;
		this.fGroup = fGroup;
		this.fStep = fStep;
		this.fIndent = fIndent;
	}

	public FreeBoardVO() {

	}

	public int getfBoard_Num() {
		return fBoard_Num;
	}

	public void setfBoard_Num(int fBoard_Num) {
		this.fBoard_Num = fBoard_Num;
	}

	public String getfId() {
		return fId;
	}

	public void setfId(String fId) {
		this.fId = fId;
	}

	public String getfTitle() {
		return fTitle;
	}

	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public Date getfDate() {
		return fDate;
	}

	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}

	public int getfHit() {
		return fHit;
	}

	public void setfHit(int fHit) {
		this.fHit = fHit;
	}

	public int getfGroup() {
		return fGroup;
	}

	public void setfGroup(int fGroup) {
		this.fGroup = fGroup;
	}

	public int getfStep() {
		return fStep;
	}

	public void setfStep(int fStep) {
		this.fStep = fStep;
	}

	public int getfIndent() {
		return fIndent;
	}

	public void setfIndent(int fIndent) {
		this.fIndent = fIndent;
	}

}
