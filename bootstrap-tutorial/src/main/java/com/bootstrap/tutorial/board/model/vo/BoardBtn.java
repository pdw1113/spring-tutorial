package com.bootstrap.tutorial.board.model.vo;

public class BoardBtn {
	
	private int prebNo;		// 이전 글 번호
	private int nextbNo;	// 다음 글 번호
	
	public BoardBtn() {
		super();
	}

	public BoardBtn(int prebNo, int nextbNo) {
		super();
		this.prebNo = prebNo;
		this.nextbNo = nextbNo;
	}

	public int getPrebNo() {
		return prebNo;
	}

	public void setPrebNo(int prebNo) {
		this.prebNo = prebNo;
	}

	public int getNextbNo() {
		return nextbNo;
	}

	public void setNextbNo(int nextbNo) {
		this.nextbNo = nextbNo;
	}

	@Override
	public String toString() {
		return "BoardBtn [prebNo=" + prebNo + ", nextbNo=" + nextbNo + "]";
	}
}
