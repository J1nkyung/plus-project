package com.project.plus.domain;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.DecimalFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ClubVO {
	private int clubNum;
	private String clubMain_pic;
	private String clubThumb_pic;
	private String clubName;
	private String clubLeader;
	private String clubTown;
	private int clubKind;
	private String clubCategory;
	private String clubOnOff;
	private int clubMax;
	private String clubFreq;
	private String clubContent1;
	private String clubContent1_pic;
	private String clubContent2;
	private String clubContent2_pic;
	private Date clubStartDate;
	private Date clubEndDate;
	private Date clubMakeDate;
	private Date clubShutDate;
	private int clubFee;
	private String clubHashtag;
	
	private int clubCurnum;
	private int clubHeart;
	private BigDecimal clubLatitude;
	private BigDecimal clubLongitude;

	private BigDecimal memberLatitude;
	private BigDecimal memberLongitude;
	// 20210403 정연 추가 
		private int memberNum;
		private int progressBar;
		private int weeks;
	//20210403 여기 위까지 정연 추가 

}
