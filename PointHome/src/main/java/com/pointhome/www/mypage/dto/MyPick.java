package com.pointhome.www.mypage.dto;

public class MyPick {
	
	private int pickNo;
	private int userNo;
	private int partNo;

	public MyPick() {}

	public MyPick(int pickNo, int userNo, int partNo) {
		super();
		this.pickNo = pickNo;
		this.userNo = userNo;
		this.partNo = partNo;
	}

	@Override
	public String toString() {
		return "MyPick [pickNo=" + pickNo + ", userNo=" + userNo + ", partNo=" + partNo + "]";
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
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
