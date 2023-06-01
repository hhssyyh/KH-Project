package com.pointhome.www.mypage.dto;

public class MyPick {
	
	private int userNo;
	private int partNo;

	public MyPick() {}

	public MyPick(int userNo, int partNo) {
		super();
		this.userNo = userNo;
		this.partNo = partNo;
	}

	@Override
	public String toString() {
		return "MyPick [userNo=" + userNo + ", partNo=" + partNo + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	
	

}
