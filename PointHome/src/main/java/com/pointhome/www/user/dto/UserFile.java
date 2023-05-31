package com.pointhome.www.user.dto;

public class UserFile {

	private int userfileNo;
	private int userNo;
	private String userImg;

	public UserFile() {}

	public UserFile(int userfileNo, int userNo, String userImg) {
		super();
		this.userfileNo = userfileNo;
		this.userNo = userNo;
		this.userImg = userImg;
	}

	@Override
	public String toString() {
		return "UserFile [userfileNo=" + userfileNo + ", userNo=" + userNo + ", userImg=" + userImg + "]";
	}

	public int getUserfileNo() {
		return userfileNo;
	}

	public void setUserfileNo(int userfileNo) {
		this.userfileNo = userfileNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	
	
}