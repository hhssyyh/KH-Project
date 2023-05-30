package com.pointhome.www.user.dto;

import java.util.Date;

public class UserQnA {

	private int userQnANo;
	private String userQnATitle;
	private String userQnAContent;
	private String userQnAAnswer;
	private String userQnAStatus;
	private String userQnADiv;
	private Date userQnADate;
	private int userNo;
	
	public UserQnA() {}

	public UserQnA(int userQnANo, String userQnATitle, String userQnAContent, String userQnAAnswer,
			String userQnAStatus, String userQnADiv, Date userQnADate, int userNo) {
		super();
		this.userQnANo = userQnANo;
		this.userQnATitle = userQnATitle;
		this.userQnAContent = userQnAContent;
		this.userQnAAnswer = userQnAAnswer;
		this.userQnAStatus = userQnAStatus;
		this.userQnADiv = userQnADiv;
		this.userQnADate = userQnADate;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "UserQnA [userQnANo=" + userQnANo + ", userQnATitle=" + userQnATitle + ", userQnAContent="
				+ userQnAContent + ", userQnAAnswer=" + userQnAAnswer + ", userQnAStatus=" + userQnAStatus
				+ ", userQnADiv=" + userQnADiv + ", userQnADate=" + userQnADate + ", userNo=" + userNo + "]";
	}

	public int getUserQnANo() {
		return userQnANo;
	}

	public void setUserQnANo(int userQnANo) {
		this.userQnANo = userQnANo;
	}

	public String getUserQnATitle() {
		return userQnATitle;
	}

	public void setUserQnATitle(String userQnATitle) {
		this.userQnATitle = userQnATitle;
	}

	public String getUserQnAContent() {
		return userQnAContent;
	}

	public void setUserQnAContent(String userQnAContent) {
		this.userQnAContent = userQnAContent;
	}

	public String getUserQnAAnswer() {
		return userQnAAnswer;
	}

	public void setUserQnAAnswer(String userQnAAnswer) {
		this.userQnAAnswer = userQnAAnswer;
	}

	public String getUserQnAStatus() {
		return userQnAStatus;
	}

	public void setUserQnAStatus(String userQnAStatus) {
		this.userQnAStatus = userQnAStatus;
	}

	public String getUserQnADiv() {
		return userQnADiv;
	}

	public void setUserQnADiv(String userQnADiv) {
		this.userQnADiv = userQnADiv;
	}

	public Date getUserQnADate() {
		return userQnADate;
	}

	public void setUserQnADate(Date userQnADate) {
		this.userQnADate = userQnADate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
}
