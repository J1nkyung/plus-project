package com.project.plus.domain;

import java.sql.Date;

public class HeartVO {
	private int heartNum;
	private int memberNum;
	private int clubNum;
	private String clubName;
	
	/*추가한 vo*/
	private String clubThumbPic;
	private Date clubStartDate;
	private Date clubEndDate;
	private int clubFee;
	private String clubLeader;
	private String clubFreq;
	private int clubNumArr[];
	
	
	public int[] getClubNumArr() {
		return clubNumArr;
	}
	public void setClubNumArr(int[] clubNumArr) {
		this.clubNumArr = clubNumArr;
	}
	public String getClubFreq() {
		return clubFreq;
	}
	public void setClubFreq(String clubFreq) {
		this.clubFreq = clubFreq;
	}
	public String getClubLeader() {
		return clubLeader;
	}
	public void setClubLeader(String clubLeader) {
		this.clubLeader = clubLeader;
	}
	public int getClubFee() {
		return clubFee;
	}
	public void setClubFee(int clubFee) {
		this.clubFee = clubFee;
	}
	
	public Date getClubStartDate() {
		return clubStartDate;
	}
	public void setClubStartDate(Date clubStartDate) {
		this.clubStartDate = clubStartDate;
	}
	public Date getClubEndDate() {
		return clubEndDate;
	}
	public void setClubEndDate(Date clubEndDate) {
		this.clubEndDate = clubEndDate;
	}
	
	public int getHeartNum() {
		return heartNum;
	}

	public void setHeartNum(int heartNum) {
		this.heartNum = heartNum;
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

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	/*추가한 vo의 getter-setter*/
	public String getClubThumbPic() {
		return clubThumbPic;
	}

	public void setClubThumbPic(String clubThumbPic) {
		this.clubThumbPic = clubThumbPic;
	}
	
	
}
