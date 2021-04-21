package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HeartVO {
	private int heartNum;
	private int memberNum;
	private int clubNum;
	private String clubName;
	
	/*추가한 vo*/
	private String clubMain_Pic;
	private Date clubStartDate;
	private Date clubEndDate;
	private int clubFee;
	private String clubLeader;
	private String clubFreq;
	private int clubNumArr[];
	
	
//	public int[] getClubNumArr() {
//		return clubNumArr;
//	}
//	public void setClubNumArr(int[] clubNumArr) {
//		this.clubNumArr = clubNumArr;
//	}
//	
	
	
}
