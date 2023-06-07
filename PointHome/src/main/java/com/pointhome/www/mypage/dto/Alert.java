package com.pointhome.www.mypage.dto;

import java.util.Date;

public class Alert {
	
	private int alertNo;
	private int commNo;
	private int freeboardNo;
	private String isRead;
	private int userNo;
	private Date alertDate;

	public Alert() {}

	public Alert(int alertNo, int commNo, int freeboardNo, String isRead, int userNo, Date alertDate) {
		super();
		this.alertNo = alertNo;
		this.commNo = commNo;
		this.freeboardNo = freeboardNo;
		this.isRead = isRead;
		this.userNo = userNo;
		this.alertDate = alertDate;
	}

	@Override
	public String toString() {
		return "Alert [alertNo=" + alertNo + ", commNo=" + commNo + ", freeboardNo=" + freeboardNo + ", isRead="
				+ isRead + ", userNo=" + userNo + ", alertDate=" + alertDate + "]";
	}

	public int getAlertNo() {
		return alertNo;
	}

	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public int getFreeboardNo() {
		return freeboardNo;
	}

	public void setFreeboardNo(int freeboardNo) {
		this.freeboardNo = freeboardNo;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(Date alertDate) {
		this.alertDate = alertDate;
	}
	
	
	
	
}

