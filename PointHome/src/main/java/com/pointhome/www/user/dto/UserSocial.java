package com.pointhome.www.user.dto;

public class UserSocial {

	private String socialId;
	private int userNo;
	private char socialType;
	
	public UserSocial() {
		// TODO Auto-generated constructor stub
	}

	public UserSocial(String socialId, int userNo, char socialType) {
		super();
		this.socialId = socialId;
		this.userNo = userNo;
		this.socialType = socialType;
	}

	@Override
	public String toString() {
		return "UserSocial [socialId=" + socialId + ", socialType=" + socialType + ", userNo=" + userNo + "]";
	}

	public String getSocialId() {
		return socialId;
	}

	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public char getSocialType() {
		return socialType;
	}

	public void setSocialType(char socialType) {
		this.socialType = socialType;
	}

	
	
}