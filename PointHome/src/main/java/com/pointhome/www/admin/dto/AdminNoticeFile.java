package com.pointhome.www.admin.dto;

import java.util.Date;

public class AdminNoticeFile {
	private int adminFileNo;
	private String adminFileOrigin;
	private String adminFileStored;
	private Date adminFileDate;
	private int noticeNo;
	
	
	public AdminNoticeFile() {
		// TODO Auto-generated constructor stub
	}


	public AdminNoticeFile(int adminFileNo, String adminFileOrigin, String adminFileStored, Date adminFileDate,
			int noticeNo) {
		super();
		this.adminFileNo = adminFileNo;
		this.adminFileOrigin = adminFileOrigin;
		this.adminFileStored = adminFileStored;
		this.adminFileDate = adminFileDate;
		this.noticeNo = noticeNo;
	}


	@Override
	public String toString() {
		return "AdminNoticeFile [adminFileNo=" + adminFileNo + ", adminFileOrigin=" + adminFileOrigin
				+ ", adminFileStored=" + adminFileStored + ", adminFileDate=" + adminFileDate + ", noticeNo=" + noticeNo
				+ "]";
	}


	public int getAdminFileNo() {
		return adminFileNo;
	}


	public void setAdminFileNo(int adminFileNo) {
		this.adminFileNo = adminFileNo;
	}


	public String getAdminFileOrigin() {
		return adminFileOrigin;
	}


	public void setAdminFileOrigin(String adminFileOrigin) {
		this.adminFileOrigin = adminFileOrigin;
	}


	public String getAdminFileStored() {
		return adminFileStored;
	}


	public void setAdminFileStored(String adminFileStored) {
		this.adminFileStored = adminFileStored;
	}


	public Date getAdminFileDate() {
		return adminFileDate;
	}


	public void setAdminFileDate(Date adminFileDate) {
		this.adminFileDate = adminFileDate;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	
	
	
	
	
		
}
