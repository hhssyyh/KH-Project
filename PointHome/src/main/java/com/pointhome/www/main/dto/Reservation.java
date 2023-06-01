package com.pointhome.www.main.dto;

import java.util.Date;

public class Reservation {

	private int resNo;
	private int partNo;
	private String resDate;
	private String resReserveno;
	private int userNo;
	private int resTime;
	private String resDiv;
	
	public Reservation() {}

	public Reservation(int resNo, int partNo, String resDate, String resReserveno, int userNo, int resTime,
			String resDiv) {
		super();
		this.resNo = resNo;
		this.partNo = partNo;
		this.resDate = resDate;
		this.resReserveno = resReserveno;
		this.userNo = userNo;
		this.resTime = resTime;
		this.resDiv = resDiv;
	}

	@Override
	public String toString() {
		return "Reservation [resNo=" + resNo + ", partNo=" + partNo + ", resDate=" + resDate + ", resReserveno="
				+ resReserveno + ", userNo=" + userNo + ", resTime=" + resTime + ", resDiv=" + resDiv + "]";
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

	public int getResTime() {
		return resTime;
	}

	public void setResTime(int resTime) {
		this.resTime = resTime;
	}

	public String getResDiv() {
		return resDiv;
	}

	public void setResDiv(String resDiv) {
		this.resDiv = resDiv;
	}

	
	
	
}
