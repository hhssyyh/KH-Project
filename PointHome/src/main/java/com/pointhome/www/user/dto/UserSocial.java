package com.pointhome.www.user.dto;

public class UserSocial {

	private String userToken;
	
	public UserSocial() {
		// TODO Auto-generated constructor stub
	}

	public UserSocial(String userToken) {
		super();
		this.userToken = userToken;
	}

	@Override
	public String toString() {
		return "UserSocial [userToken=" + userToken + "]";
	}

	public String getUserToken() {
		return userToken;
	}

	public void setUserToken(String userToken) {
		this.userToken = userToken;
	}
	
	
}