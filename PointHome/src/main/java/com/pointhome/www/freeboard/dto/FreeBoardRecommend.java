package com.pointhome.www.freeboard.dto;

public class FreeBoardRecommend {

	private int userNo;
	private int boardNo;
	
	public FreeBoardRecommend() {}

	public FreeBoardRecommend(int userNo, int boardNo) {
		super();
		this.userNo = userNo;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "FreeBoardRecommend [userNo=" + userNo + ", boardNo=" + boardNo + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
	
}
