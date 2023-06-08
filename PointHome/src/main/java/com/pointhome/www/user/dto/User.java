package com.pointhome.www.user.dto;

import java.util.Date;

public class User {

	private int userNo;
	private String userName;
	private String userPw;
	private String userNick;
	private String userEmail;
	private char userGender;
	private int userBirthYear;
	private int userBirthMonth;
	private int userBirthDay;
	private String userPhone;
	private int userPostCode;
	private String userAddress;
	private String userDetailAddress;
	private String userExtraAddress;
	private Date userJoindate;

	public User() {}

	public User(int userNo, String userName, String userPw, String userNick, String userEmail, char userGender,
			int userBirthYear, int userBirthMonth, int userBirthDay, String userPhone, int userPostCode,
			String userAddress, String userDetailAddress, String userExtraAddress, Date userJoindate) {
	 	super();
		this.userNo = userNo;
		this.userName = userName;
		this.userPw = userPw;
		this.userNick = userNick;
		this.userEmail = userEmail;
		this.userGender = userGender;
		this.userBirthYear = userBirthYear;
		this.userBirthMonth = userBirthMonth;
		this.userBirthDay = userBirthDay;
		this.userPhone = userPhone;
		this.userPostCode = userPostCode;
		this.userAddress = userAddress;
		this.userDetailAddress = userDetailAddress;
		this.userExtraAddress = userExtraAddress;
		this.userJoindate = userJoindate;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userName=" + userName + ", userPw=" + userPw + ", userNick=" + userNick
				+ ", userEmail=" + userEmail + ", userGender=" + userGender + ", userBirthYear=" + userBirthYear
				+ ", userBirthMonth=" + userBirthMonth + ", userBirthDay=" + userBirthDay + ", userPhone=" + userPhone
				+ ", userPostCode=" + userPostCode + ", userAddress=" + userAddress + ", userDetailAddress="
				+ userDetailAddress + ", userExtraAddress=" + userExtraAddress + ", userJoindate=" + userJoindate + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public char getUserGender() {
		return userGender;
	}

	public void setUserGender(char userGender) {
		this.userGender = userGender;
	}

	public int getUserBirthYear() {
		return userBirthYear;
	}

	public void setUserBirthYear(int userBirthYear) {
		this.userBirthYear = userBirthYear;
	}

	public int getUserBirthMonth() {
		return userBirthMonth;
	}

	public void setUserBirthMonth(int userBirthMonth) {
		this.userBirthMonth = userBirthMonth;
	}

	public int getUserBirthDay() {
		return userBirthDay;
	}

	public void setUserBirthDay(int userBirthDay) {
		this.userBirthDay = userBirthDay;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getUserPostCode() {
		return userPostCode;
	}

	public void setUserPostCode(int userPostCode) {
		this.userPostCode = userPostCode;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserDetailAddress() {
		return userDetailAddress;
	}

	public void setUserDetailAddress(String userDetailAddress) {
		this.userDetailAddress = userDetailAddress;
	}

	public String getUserExtraAddress() {
		return userExtraAddress;
	}

	public void setUserExtraAddress(String userExtraAddress) {
		this.userExtraAddress = userExtraAddress;
	}

	public Date getUserJoindate() {
		return userJoindate;
	}

	public void setUserJoindate(Date userJoindate) {
		this.userJoindate = userJoindate;
	}

	
}