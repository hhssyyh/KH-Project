package com.pointhome.www.main.dto;

import java.util.Date;

public class Reservation {

	private int resNo;
	private int partNo;
	private String resDate;
	private String resReserveno;
	private int userNo;
	
	public Reservation() {}

	public Reservation(int resNo, int partNo, String resDate, String resReserveno, int userNo) {
		super();
		this.resNo = resNo;
		this.partNo = partNo;
		this.resDate = resDate;
		this.resReserveno = resReserveno;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Reservation [resNo=" + resNo + ", partNo=" + partNo + ", resDate=" + resDate + ", resReserveno="
				+ resReserveno + ", userNo=" + userNo + "]";
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResReserveno() {
		return resReserveno;
	}

	public void setResReserveno(String resReserveno) {
		this.resReserveno = resReserveno;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	

	
	
}
