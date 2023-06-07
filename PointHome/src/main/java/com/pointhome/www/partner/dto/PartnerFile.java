package com.pointhome.www.partner.dto;

public class PartnerFile {

	private int partnerfileNo;
	private int partnerNo;
	private String partnerImg;
	
	public PartnerFile() {}

	public PartnerFile(int partnerfileNo, int partnerNo, String partnerImg) {
		super();
		this.partnerfileNo = partnerfileNo;
		this.partnerNo = partnerNo;
		this.partnerImg = partnerImg;
	}

	@Override
	public String toString() {
		return "PartnerFile [partnerfileNo=" + partnerfileNo + ", partnerNo=" + partnerNo + ", partnerImg=" + partnerImg
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
