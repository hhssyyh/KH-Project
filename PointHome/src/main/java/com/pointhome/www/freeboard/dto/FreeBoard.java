package com.pointhome.www.freeboard.dto;

import java.util.Date;

public class FreeBoard {
	
	   private int userNo;
	   private int freeboardNo;
	   private int freeboardHit;
	   private Date freeboardDate;
	   private String freeboardTitle;
	   private String freeboardContent;
	
	public FreeBoard() {}

	public FreeBoard(int userNo, int freeboardNo, int freeboardHit, Date freeboardDate, String freeboardTitle,
			String freeboardContent) {
		super();
		this.userNo = userNo;
		this.freeboardNo = freeboardNo;
		this.freeboardHit = freeboardHit;
		this.freeboardDate = freeboardDate;
		this.freeboardTitle = freeboardTitle;
		this.freeboardContent = freeboardContent;
	}

	@Override
	public String toString() {
		return "FreeBoard [userNo=" + userNo + ", freeboardNo=" + freeboardNo + ", freeboardHit=" + freeboardHit
				+ ", freeboardDate=" + freeboardDate + ", freeboardTitle=" + freeboardTitle + ", freeboardContent="
				+ freeboardContent + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getFreeboardNo() {
		return freeboardNo;
	}

	public void setFreeboardNo(int freeboardNo) {
		this.freeboardNo = freeboardNo;
	}

	public int getFreeboardHit() {
		return freeboardHit;
	}

	public void setFreeboardHit(int freeboardHit) {
		this.freeboardHit = freeboardHit;
	}

	public Date getFreeboardDate() {
		return freeboardDate;
	}

	public void setFreeboardDate(Date freeboardDate) {
		this.freeboardDate = freeboardDate;
	}

	public String getFreeboardTitle() {
		return freeboardTitle;
	}

	public void setFreeboardTitle(String freeboardTitle) {
		this.freeboardTitle = freeboardTitle;
	}

	public String getFreeboardContent() {
		return freeboardContent;
	}

	public void setFreeboardContent(String freeboardContent) {
		this.freeboardContent = freeboardContent;
	}
	
	
	   
	   
	


}
