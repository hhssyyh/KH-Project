package com.pointhome.www.user.dto;

import java.util.Date;

public class UserLoginReg {

	private int userLogNo;
	private Date userLoginDate;
	private Date userLogoutDate;
	
	public UserLoginReg() {}

	public UserLoginReg(int userLogNo, Date userLoginDate, Date userLogoutDate) {
		super();
		this.userLogNo = userLogNo;
		this.userLoginDate = userLoginDate;
		this.userLogoutDate = userLogoutDate;
	}

	public int getUserLogNo() {
		return userLogNo;
	}

	public void setUserLogNo(int userLogNo) {
		this.userLogNo = userLogNo;
	}

	public Date getUserLoginDate() {
		return userLoginDate;
	}

	public void setUserLoginDate(Date userLoginDate) {
		this.userLoginDate = userLoginDate;
	}

	public Date getUserLogoutDate() {
		return userLogoutDate;
	}

	public void setUserLogoutDate(Date userLogoutDate) {
		this.userLogoutDate = userLogoutDate;
	}
	
}