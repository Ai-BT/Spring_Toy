package com.wmk.ex.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class FileUploadVO {

	int fileNo;
	int rBoardNum;
	String originalFileName;
	String storedFileName;
	int fileSize;
	Timestamp regdate;

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRboardNum() {
		return rBoardNum;
	}

	public void setRboardNum(int rBoardNum) {
		this.rBoardNum = rBoardNum;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "FileUploadVO [fileNo=" + fileNo + ", rBoardNum=" + rBoardNum + ", originalFileName=" + originalFileName
				+ ", storedFileName=" + storedFileName + ", fileSize=" + fileSize + ", regdate=" + regdate + "]";
	}

}
