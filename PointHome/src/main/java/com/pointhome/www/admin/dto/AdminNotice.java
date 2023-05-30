package com.pointhome.www.admin.dto;

import java.util.Date;

public class AdminNotice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int adminNo;
	private char div;
	
	public AdminNotice() {
		// TODO Auto-generated constructor stub
	}

	public AdminNotice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, int adminNo, char div) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.adminNo = adminNo;
		this.div = div;
	}

	@Override
	public String toString() {
		return "AdminNotice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", adminNo=" + adminNo + ", div=" + div + "]";
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public char getDiv() {
		return div;
	}

	public void setDiv(char div) {
		this.div = div;
	}
	
}
