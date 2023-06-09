package com.pointhome.www.partner.dto;

import java.util.Date;

public class PartnerVideo {
	
	private int partnerVideoNo;
	private String partnerVideoUrl;
	private Date partnerVideoDate;
	private int partnerNo;
	
	public PartnerVideo() {}

	
	public PartnerVideo(int partnerVideoNo, String partnerVideoUrl, Date partnerVideoDate, int partnerNo) {
		super();
		this.partnerVideoNo = partnerVideoNo;
		this.partnerVideoUrl = partnerVideoUrl;
		this.partnerVideoDate = partnerVideoDate;
		this.partnerNo = partnerNo;
	}


	@Override
	public String toString() {
		return "PartnerVideo [partnerVideoNo=" + partnerVideoNo + ", partnerVideoUrl=" + partnerVideoUrl
				+ ", partnerVideoDate=" + partnerVideoDate + ", partnerNo=" + partnerNo + "]";
	}

	public int getPartnerVideoNo() {
		return partnerVideoNo;
	}

	public void setPartnerVideoNo(int partnerVideoNo) {
		this.partnerVideoNo = partnerVideoNo;
	}

	public String getPartnerVideoUrl() {
		return partnerVideoUrl;
	}

	public void setPartnerVideoUrl(String partnerVideoUrl) {
		this.partnerVideoUrl = partnerVideoUrl;
	}

	public Date getPartnerVideoDate() {
		return partnerVideoDate;
	}

	public void setPartnerVideoDate(Date partnerVideoDate) {
		this.partnerVideoDate = partnerVideoDate;
	}

	public int getPartnerNo() {
		return partnerNo;
	}

	public void setPartnerNo(int partnerNo) {
		this.partnerNo = partnerNo;
	}
	
	

	
	
}
