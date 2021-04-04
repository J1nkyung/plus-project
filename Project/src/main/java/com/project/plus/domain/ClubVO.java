package com.project.plus.domain;

import java.sql.Date;

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
	private String clubLatitude;
	private String clubLongitude;



}
