package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApplyVO {
	private int applyNum;
	private int memberNum;
	private int clubNum;
	private Date applyDate;
	
	// 정연 하단 추가 20210326
	private String clubName;
	private int clubFee;
	private int totalFee;	// db 컬럼은 없지만 결제할 때 총 금액 담는 용도.
	private int[] clubNumArr;
	
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public int getClubFee() {
		return clubFee;
	}
	public void setClubFee(int clubFee) {
		this.clubFee = clubFee;
	}
	public int getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
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
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public int getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(int totalFee) {
		this.totalFee = totalFee;
	}
	public int[] getClubNumArr() {
		return clubNumArr;
	}
	public void setClubNumArr(int[] clubNumArr) {
		this.clubNumArr = clubNumArr;
	}
	
}
