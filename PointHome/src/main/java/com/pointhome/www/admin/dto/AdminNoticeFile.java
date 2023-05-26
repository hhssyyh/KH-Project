package com.pointhome.www.admin.dto;

import java.util.Date;

public class AdminNoticeFile {
	private int adminFileno;
	private String adminFilename;
	private Date adminFiledate;
	private int noticeNo;
	
	public AdminNoticeFile() {
		// TODO Auto-generated constructor stub
	}

	public AdminNoticeFile(int adminFileno, String adminFilename, Date adminFiledate, int noticeNo) {
		super();
		this.adminFileno = adminFileno;
		this.adminFilename = adminFilename;
		this.adminFiledate = adminFiledate;
		this.noticeNo = noticeNo;
	}

	@Override
	public String toString() {
		return "AdminNoticeFile [adminFileno=" + adminFileno + ", adminFilename=" + adminFilename + ", adminFiledate="
				+ adminFiledate + ", noticeNo=" + noticeNo + "]";
	}

	public int getAdminFileno() {
		return adminFileno;
	}

	public void setAdminFileno(int adminFileno) {
		this.adminFileno = adminFileno;
	}

	public String getAdminFilename() {
		return adminFilename;
	}

	public void setAdminFilename(String adminFilename) {
		this.adminFilename = adminFilename;
	}

	public Date getAdminFiledate() {
		return adminFiledate;
	}

	public void setAdminFiledate(Date adminFiledate) {
		this.adminFiledate = adminFiledate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	
}
