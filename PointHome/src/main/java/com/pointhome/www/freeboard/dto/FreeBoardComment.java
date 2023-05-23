package com.pointhome.www.freeboard.dto;

import java.util.Date;

public class FreeBoardComment {
	
	private int commNo;
	private String commContent;
	private Date commDate;
	private int freeboardNo;
	private int userNo;
	
	public FreeBoardComment() {}

	@Override
	public String toString() {
		return "FreeBoardComment [commNo=" + commNo + ", commContent=" + commContent + ", commDate=" + commDate
				+ ", freeboardNo=" + freeboardNo + ", userNo=" + userNo + "]";
	}

	public FreeBoardComment(int commNo, String commContent, Date commDate, int freeboardNo, int userNo) {
		super();
		this.commNo = commNo;
		this.commContent = commContent;
		this.commDate = commDate;
		this.freeboardNo = freeboardNo;
		this.userNo = userNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}

	public int getFreeboardNo() {
		return freeboardNo;
	}

	public void setFreeboardNo(int freeboardNo) {
		this.freeboardNo = freeboardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
