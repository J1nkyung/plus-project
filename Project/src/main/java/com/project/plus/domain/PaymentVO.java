package com.project.plus.domain;

import java.sql.Date;

public class PaymentVO {
	private int payNum;
	private int memberNum;
	private int clubNum;
	private int payAmount;
	private String payMethod;
	private Date payDate;
	/*추가한 vo*/
	private int memberPoint;
	
	// 현정 추가 0404
	private String memberNickname;
	private String clubName;
	

	
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getClubNum() {
		return clubNum;
	}
	public void setClubNum(int clubNum) {
		this.clubNum = clubNum;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	/*추가한 vo의 getter- setter*/
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	
	// 현정 추가 0404
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	
	@Override
	public String toString() {
		return "PaymentVO [payNum=" + payNum + ", memberNum=" + memberNum + ", clubNum=" + clubNum + ", payAmount="
				+ payAmount + ", payMethod=" + payMethod + ", payDate=" + payDate + ", memberPoint=" + memberPoint + ", memberNickname=" + memberNickname + ", clubName=" + clubName
				+ "]";
	}
	
	
}
