package com.pointhome.www.freeboard.dto;

public class FreeBoardFile {
	
	private int freeboardNo;
	private int freeboardfileNo;
	private String freeboardfileOrigin;
	private String freeboardfileStored;
	
	public FreeBoardFile() {}

	public FreeBoardFile(int freeboardNo, int freeboardfileNo, String freeboardfileOrigin, String freeboardfileStored) {
		super();
		this.freeboardNo = freeboardNo;
		this.freeboardfileNo = freeboardfileNo;
		this.freeboardfileOrigin = freeboardfileOrigin;
		this.freeboardfileStored = freeboardfileStored;
	}

	@Override
	public String toString() {
		return "FreeBoardFile [freeboardNo=" + freeboardNo + ", freeboardfileNo=" + freeboardfileNo
				+ ", freeboardfileOrigin=" + freeboardfileOrigin + ", freeboardfileStored=" + freeboardfileStored + "]";
	}

	public int getFreeboardNo() {
		return freeboardNo;
	}

	public void setFreeboardNo(int freeboardNo) {
		this.freeboardNo = freeboardNo;
	}

	public int getFreeboardfileNo() {
		return freeboardfileNo;
	}

	public void setFreeboardfileNo(int freeboardfileNo) {
		this.freeboardfileNo = freeboardfileNo;
	}

	public String getFreeboardfileOrigin() {
		return freeboardfileOrigin;
	}

	public void setFreeboardfileOrigin(String freeboardfileOrigin) {
		this.freeboardfileOrigin = freeboardfileOrigin;
	}

	public String getFreeboardfileStored() {
		return freeboardfileStored;
	}

	public void setFreeboardfileStored(String freeboardfileStored) {
		this.freeboardfileStored = freeboardfileStored;
	}
	
	
	
	

	
	
	
	
	

}
