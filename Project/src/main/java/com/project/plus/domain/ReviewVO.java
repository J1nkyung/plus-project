 package com.project.plus.domain;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@XmlRootElement(name="selectNotReview")
@XmlAccessorType(XmlAccessType.FIELD)

@Getter
@Setter
@ToString
public class ReviewVO {
	@XmlElement(name="review")
	@XmlAttribute
	private int reviewNum;
	private int memberNum;
	private int clubNum;
	private String reviewContent;
	private int reviewRate;
	
	// for join 
	private MemberVO members;
	
	@JsonFormat(pattern="yyyy. MM. dd HH:mm:ss", timezone ="Asia/Seoul")
	private Date reviewRegDate;
	
	/*필요한 VO*/
	@XmlTransient
	private String clubMain_pic;
	@XmlTransient
	private String clubName;
	private Date startDate;
	private Date endDate;
	
}
