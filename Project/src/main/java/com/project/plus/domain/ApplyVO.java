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
	
	//순근 추가 0405 for 참여중 회원
	private String memberPic;
	private String memberNickname;
	

//	public int[] getClubNumArr() {
//		return clubNumArr;
//	}
//	public void setClubNumArr(int[] clubNumArr) {
//		this.clubNumArr = clubNumArr;
//	}
	
}
