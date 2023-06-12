package com.pointhome.www.mypage.dto;

public class ReviewFile {
	
	private int reviewfileNo;
	private String reviewfileOrigin;
	private String reviewfileStored;
	private int reviewNo;
	
	public ReviewFile() {}

	public ReviewFile(int reviewfileNo, String reviewfileOrigin, String reviewfileStored, int reviewNo) {
		super();
		this.reviewfileNo = reviewfileNo;
		this.reviewfileOrigin = reviewfileOrigin;
		this.reviewfileStored = reviewfileStored;
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "ReviewFile [reviewfileNo=" + reviewfileNo + ", reviewfileOrigin=" + reviewfileOrigin
				+ ", reviewfileStored=" + reviewfileStored + ", reviewNo=" + reviewNo + "]";
	}

	public int getReviewfileNo() {
		return reviewfileNo;
	}

	public void setReviewfileNo(int reviewfileNo) {
		this.reviewfileNo = reviewfileNo;
	}

	public String getReviewfileOrigin() {
		return reviewfileOrigin;
	}

	public void setReviewfileOrigin(String reviewfileOrigin) {
		this.reviewfileOrigin = reviewfileOrigin;
	}

	public String getReviewfileStored() {
		return reviewfileStored;
	}

	public void setReviewfileStored(String reviewfileStored) {
		this.reviewfileStored = reviewfileStored;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	
	

}
