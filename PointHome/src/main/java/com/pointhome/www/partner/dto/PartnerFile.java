package com.pointhome.www.partner.dto;

public class PartnerFile {

	private int partnerfileNo;
	private String partnerImg;
	private int partnerNo;
	
	public PartnerFile() {}

	public PartnerFile(int partnerfileNo, String partnerImg, int partnerNo) {
		super();
		this.partnerfileNo = partnerfileNo;
		this.partnerImg = partnerImg;
		this.partnerNo = partnerNo;
	}

	@Override
	public String toString() {
		return "PartnerFile [partnerfileNo=" + partnerfileNo + ", partnerImg=" + partnerImg + ", partnerNo=" + partnerNo
				+ "]";
	}

	public int getPartnerfileNo() {
		return partnerfileNo;
	}

	public void setPartnerfileNo(int partnerfileNo) {
		this.partnerfileNo = partnerfileNo;
	}

	public int getPartnerNo() {
		return partnerNo;
	}

	public void setPartnerNo(int partnerNo) {
		this.partnerNo = partnerNo;
	}

	public String getPartnerImg() {
		return partnerImg;
	}

	public void setPartnerImg(String partnerImg) {
		this.partnerImg = partnerImg;
	}	
	
}
