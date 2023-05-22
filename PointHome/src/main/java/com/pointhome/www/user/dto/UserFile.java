package com.pointhome.www.user.dto;

public class UserFile {

	private String userImg;

	public UserFile() {
		// TODO Auto-generated constructor stub
	}

	public UserFile(String userImg) {
		super();
		this.userImg = userImg;
	}

	@Override
	public String toString() {
		return "UserFile [userImg=" + userImg + "]";
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	
}