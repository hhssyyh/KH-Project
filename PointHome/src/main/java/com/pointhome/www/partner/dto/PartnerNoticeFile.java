package com.pointhome.www.partner.dto;

import java.util.Date;

public class PartnerNoticeFile {
	private int partnerNoticeFileNo;
	private String partnerNoticeFileOrigin;
	private String partnerNoticeFileStored;
	private Date partnerNoticeFileDate;
	private int partnerNoticeNo;
	
	public PartnerNoticeFile() {
		// TODO Auto-generated constructor stub
	}

	public PartnerNoticeFile(int partnerNoticeFileNo, String partnerNoticeFileOrigin, String partnerNoticeFileStored,
			Date partnerNoticeFileDate, int partnerNoticeNo) {
		super();
		this.partnerNoticeFileNo = partnerNoticeFileNo;
		this.partnerNoticeFileOrigin = partnerNoticeFileOrigin;
		this.partnerNoticeFileStored = partnerNoticeFileStored;
		this.partnerNoticeFileDate = partnerNoticeFileDate;
		this.partnerNoticeNo = partnerNoticeNo;
	}

	@Override
	public String toString() {
		return "PartnerNoticeFile [partnerNoticeFileNo=" + partnerNoticeFileNo + ", partnerNoticeFileOrigin="
				+ partnerNoticeFileOrigin + ", partnerNoticeFileStored=" + partnerNoticeFileStored
				+ ", partnerNoticeFileDate=" + partnerNoticeFileDate + ", partnerNoticeNo=" + partnerNoticeNo + "]";
	}

	public int getPartnerNoticeFileNo() {
		return partnerNoticeFileNo;
	}

	public void setPartnerNoticeFileNo(int partnerNoticeFileNo) {
		this.partnerNoticeFileNo = partnerNoticeFileNo;
	}

	public String getPartnerNoticeFileOrigin() {
		return partnerNoticeFileOrigin;
	}

	public void setPartnerNoticeFileOrigin(String partnerNoticeFileOrigin) {
		this.partnerNoticeFileOrigin = partnerNoticeFileOrigin;
	}

	public String getPartnerNoticeFileStored() {
		return partnerNoticeFileStored;
	}

	public void setPartnerNoticeFileStored(String partnerNoticeFileStored) {
		this.partnerNoticeFileStored = partnerNoticeFileStored;
	}

	public Date getPartnerNoticeFileDate() {
		return partnerNoticeFileDate;
	}

	public void setPartnerNoticeFileDate(Date partnerNoticeFileDate) {
		this.partnerNoticeFileDate = partnerNoticeFileDate;
	}

	public int getPartnerNoticeNo() {
		return partnerNoticeNo;
	}

	public void setPartnerNoticeNo(int partnerNoticeNo) {
		this.partnerNoticeNo = partnerNoticeNo;
	}
	
	
	
}
