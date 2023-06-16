package com.pointhome.www.mail.dto;

import java.sql.Date;

public class UserEmailCode {
	private String userEmail;
	private String userEmailCode;
	private Date emailCodeDate;

	public UserEmailCode() {}

	public UserEmailCode(String userEmail, String userEmailCode, Date emailCodeDate) {
		super();
		this.userEmail = userEmail;
		this.userEmailCode = userEmailCode;
		this.emailCodeDate = emailCodeDate;
	}

	@Override
	public String toString() {
		return "userEmailCode [userEmail=" + userEmail + ", userEmailCode=" + userEmailCode + ", emailCodeDate="
				+ emailCodeDate + "]";
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserEmailCode() {
		return userEmailCode;
	}

	public void setUserEmailCode(String userEmailCode) {
		this.userEmailCode = userEmailCode;
	}

	public Date getEmailCodeDate() {
		return emailCodeDate;
	}

	public void setEmailCodeDate(Date emailCodeDate) {
		this.emailCodeDate = emailCodeDate;
	}

}
