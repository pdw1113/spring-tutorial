package com.bootstrap.tutorial.board.model.vo;

import java.util.Date; // 시,분,초 를 표시할 수 있게 java.sql.Date가 아닌 util.Date를 import 한다.

public class Board {
	
	private int bNo;				// 게시글 번호
	private String bWritter;		// 작성자
	private String bPassword;		// 비밀번호
	private String bPasswordEnc;	// 비밀번호 (암호화)
	private String bSubject;		// 제목
	private String bContent;		// 내용
	private Date bRegDate;			// 등록일
	private Date bModDate;			// 수정일
	private int bCount;				// 조회수
	private char bStatus;			// 삭제 여부 (Y = 표시O / N = 표시X[삭제됨])
	
	private int prebNo;				// 이전 글 번호
	private int nextbNo;			// 다음 글 번호
	
	public Board() {
		super();
	}

	public Board(int bNo, String bWritter, String bPassword, String bPasswordEnc, String bSubject, String bContent,
			Date bRegDate, Date bModDate, int bCount, char bStatus) {
		super();
		this.bNo = bNo;
		this.bWritter = bWritter;
		this.bPassword = bPassword;
		this.bPasswordEnc = bPasswordEnc;
		this.bSubject = bSubject;
		this.bContent = bContent;
		this.bRegDate = bRegDate;
		this.bModDate = bModDate;
		this.bCount = bCount;
		this.bStatus = bStatus;
	}
	
	public Board(int bNo, String bWritter, String bPassword, String bPasswordEnc, String bSubject, String bContent,
			Date bRegDate, Date bModDate, int bCount, char bStatus, int prebNo, int nextbNo) {
		super();
		this.bNo = bNo;
		this.bWritter = bWritter;
		this.bPassword = bPassword;
		this.bPasswordEnc = bPasswordEnc;
		this.bSubject = bSubject;
		this.bContent = bContent;
		this.bRegDate = bRegDate;
		this.bModDate = bModDate;
		this.bCount = bCount;
		this.bStatus = bStatus;
		this.prebNo = prebNo;
		this.nextbNo = nextbNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbWritter() {
		return bWritter;
	}

	public void setbWritter(String bWritter) {
		this.bWritter = bWritter;
	}

	public String getbPassword() {
		return bPassword;
	}

	public void setbPassword(String bPassword) {
		this.bPassword = bPassword;
	}

	public String getbPasswordEnc() {
		return bPasswordEnc;
	}

	public void setbPasswordEnc(String bPasswordEnc) {
		this.bPasswordEnc = bPasswordEnc;
	}

	public String getbSubject() {
		return bSubject;
	}

	public void setbSubject(String bSubject) {
		this.bSubject = bSubject;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbRegDate() {
		return bRegDate;
	}

	public void setbRegDate(Date bRegDate) {
		this.bRegDate = bRegDate;
	}

	public Date getbModDate() {
		return bModDate;
	}

	public void setbModDate(Date bModDate) {
		this.bModDate = bModDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public char getbStatus() {
		return bStatus;
	}

	public void setbStatus(char bStatus) {
		this.bStatus = bStatus;
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
		return "Board [bNo=" + bNo + ", bWritter=" + bWritter + ", bPassword=" + bPassword + ", bPasswordEnc="
				+ bPasswordEnc + ", bSubject=" + bSubject + ", bContent=" + bContent + ", bRegDate=" + bRegDate
				+ ", bModDate=" + bModDate + ", bCount=" + bCount + ", bStatus=" + bStatus + ", prebNo=" + prebNo
				+ ", nextbNo=" + nextbNo + "]";
	}
}
