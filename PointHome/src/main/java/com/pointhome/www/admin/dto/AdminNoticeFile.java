package com.pointhome.www.admin.dto;

import java.util.Date;

public class AdminNoticeFile {
	private int admin_fileno;
	private String admin_file_origin;
	private String admin_file_stored;
	private Date admin_filedate;
	private int notice_no;
	
	
	public AdminNoticeFile() {
		// TODO Auto-generated constructor stub
	}


	public AdminNoticeFile(int admin_fileno, String admin_file_origin, String admin_file_stored, Date admin_filedate,
			int notice_no) {
		super();
		this.admin_fileno = admin_fileno;
		this.admin_file_origin = admin_file_origin;
		this.admin_file_stored = admin_file_stored;
		this.admin_filedate = admin_filedate;
		this.notice_no = notice_no;
	}

	@Override
	public String toString() {
		return "AdminNoticeFile [admin_fileno=" + admin_fileno + ", admin_file_origin=" + admin_file_origin
				+ ", admin_file_stored=" + admin_file_stored + ", admin_filedate=" + admin_filedate + ", notice_no="
				+ notice_no + "]";
	}


	public int getAdmin_fileno() {
		return admin_fileno;
	}


	public void setAdmin_fileno(int admin_fileno) {
		this.admin_fileno = admin_fileno;
	}


	public String getAdmin_file_origin() {
		return admin_file_origin;
	}


	public void setAdmin_file_origin(String admin_file_origin) {
		this.admin_file_origin = admin_file_origin;
	}


	public String getAdmin_file_stored() {
		return admin_file_stored;
	}


	public void setAdmin_file_stored(String admin_file_stored) {
		this.admin_file_stored = admin_file_stored;
	}


	public Date getAdmin_filedate() {
		return admin_filedate;
	}


	public void setAdmin_filedate(Date admin_filedate) {
		this.admin_filedate = admin_filedate;
	}


	public int getNotice_no() {
		return notice_no;
	}


	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	
	
}
