package com.pointhome.www.mypage.dto;

import java.util.Date;

public class Alert {
	
	private int alertNo;
	private int userNo;
	private String isRead;
	private Date alertDate;
	private String content;
	private int num;
	private String type;
	
	public Alert() {}

	public Alert(int alertNo, int userNo, String isRead, Date alertDate, String content, int num, String type) {
		super();
		this.alertNo = alertNo;
		this.userNo = userNo;
		this.isRead = isRead;
		this.alertDate = alertDate;
		this.content = content;
		this.num = num;
		this.type = type;
	}

	@Override
	public String toString() {
		return "Alert [alertNo=" + alertNo + ", userNo=" + userNo + ", isRead=" + isRead + ", alertDate=" + alertDate
				+ ", content=" + content + ", num=" + num + ", type=" + type + "]";
	}

	public int getAlertNo() {
		return alertNo;
	}

	public void setAlertNo(int alertNo) {
		this.alertNo = alertNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	public Date getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(Date alertDate) {
		this.alertDate = alertDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	
	
	
	
}

