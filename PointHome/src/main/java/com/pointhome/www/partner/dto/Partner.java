package com.pointhome.www.partner.dto;

import java.util.Date;

public class Partner {
	private int partnerNo;
	private String partnerName;
	private String partnerPw;
	private String partnerNick;
	private String partnerEmail;
	private String partnerPhone;
	private String partnerBank;
	private String partnerAccount;
	private char partnerGender;
	private int partnerBirthyear;
	private int partnerBirthmonth;
	private int partnerBirthday;
	private int partnerPostcode;
	private String partnerAddress;
	private String partnerDetailaddress;
	private String partnerExtraaddress;
	private Date partnerJoindate;
	
	public Partner() {
		// TODO Auto-generated constructor stub
	}

	public Partner(int partnerNo, String partnerName, String partnerPw, String partnerNick, String partnerEmail,
			String partnerPhone, String partnerBank, String partnerAccount, char partnerGender, int partnerBirthyear,
			int partnerBirthmonth, int partnerBirthday, int partnerPostcode, String partnerAddress,
			String partnerDetailaddress, String partnerExtraaddress, Date partnerJoindate) {
		super();
		this.partnerNo = partnerNo;
		this.partnerName = partnerName;
		this.partnerPw = partnerPw;
		this.partnerNick = partnerNick;
		this.partnerEmail = partnerEmail;
		this.partnerPhone = partnerPhone;
		this.partnerBank = partnerBank;
		this.partnerAccount = partnerAccount;
		this.partnerGender = partnerGender;
		this.partnerBirthyear = partnerBirthyear;
		this.partnerBirthmonth = partnerBirthmonth;
		this.partnerBirthday = partnerBirthday;
		this.partnerPostcode = partnerPostcode;
		this.partnerAddress = partnerAddress;
		this.partnerDetailaddress = partnerDetailaddress;
		this.partnerExtraaddress = partnerExtraaddress;
		this.partnerJoindate = partnerJoindate;
	}

	@Override
	public String toString() {
		return "Partner [partnerNo=" + partnerNo + ", partnerName=" + partnerName + ", partnerPw=" + partnerPw
				+ ", partnerNick=" + partnerNick + ", partnerEmail=" + partnerEmail + ", partnerPhone=" + partnerPhone
				+ ", partnerBank=" + partnerBank + ", partnerAccount=" + partnerAccount + ", partnerGender="
				+ partnerGender + ", partnerBirthyear=" + partnerBirthyear + ", partnerBirthmonth=" + partnerBirthmonth
				+ ", partnerBirthday=" + partnerBirthday + ", partnerPostcode=" + partnerPostcode + ", partnerAddress="
				+ partnerAddress + ", partnerDetailaddress=" + partnerDetailaddress + ", partnerExtraaddress="
				+ partnerExtraaddress + ", partnerJoindate=" + partnerJoindate + "]";
	}

	public int getPartnerNo() {
		return partnerNo;
	}

	public void setPartnerNo(int partnerNo) {
		this.partnerNo = partnerNo;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getPartnerPw() {
		return partnerPw;
	}

	public void setPartnerPw(String partnerPw) {
		this.partnerPw = partnerPw;
	}

	public String getPartnerNick() {
		return partnerNick;
	}

	public void setPartnerNick(String partnerNick) {
		this.partnerNick = partnerNick;
	}

	public String getPartnerEmail() {
		return partnerEmail;
	}

	public void setPartnerEmail(String partnerEmail) {
		this.partnerEmail = partnerEmail;
	}

	public String getPartnerPhone() {
		return partnerPhone;
	}

	public void setPartnerPhone(String partnerPhone) {
		this.partnerPhone = partnerPhone;
	}

	public String getPartnerBank() {
		return partnerBank;
	}

	public void setPartnerBank(String partnerBank) {
		this.partnerBank = partnerBank;
	}

	public String getPartnerAccount() {
		return partnerAccount;
	}

	public void setPartnerAccount(String partnerAccount) {
		this.partnerAccount = partnerAccount;
	}

	public char getPartnerGender() {
		return partnerGender;
	}

	public void setPartnerGender(char partnerGender) {
		this.partnerGender = partnerGender;
	}

	public int getPartnerBirthyear() {
		return partnerBirthyear;
	}

	public void setPartnerBirthyear(int partnerBirthyear) {
		this.partnerBirthyear = partnerBirthyear;
	}

	public int getPartnerBirthmonth() {
		return partnerBirthmonth;
	}

	public void setPartnerBirthmonth(int partnerBirthmonth) {
		this.partnerBirthmonth = partnerBirthmonth;
	}

	public int getPartnerBirthday() {
		return partnerBirthday;
	}

	public void setPartnerBirthday(int partnerBirthday) {
		this.partnerBirthday = partnerBirthday;
	}

	public int getPartnerPostcode() {
		return partnerPostcode;
	}

	public void setPartnerPostcode(int partnerPostcode) {
		this.partnerPostcode = partnerPostcode;
	}

	public String getPartnerAddress() {
		return partnerAddress;
	}

	public void setPartnerAddress(String partnerAddress) {
		this.partnerAddress = partnerAddress;
	}

	public String getPartnerDetailaddress() {
		return partnerDetailaddress;
	}

	public void setPartnerDetailaddress(String partnerDetailaddress) {
		this.partnerDetailaddress = partnerDetailaddress;
	}

	public String getPartnerExtraaddress() {
		return partnerExtraaddress;
	}

	public void setPartnerExtraaddress(String partnerExtraaddress) {
		this.partnerExtraaddress = partnerExtraaddress;
	}

	public Date getPartnerJoindate() {
		return partnerJoindate;
	}

	public void setPartnerJoindate(Date partnerJoindate) {
		this.partnerJoindate = partnerJoindate;
	}
	
	
	
	
}
