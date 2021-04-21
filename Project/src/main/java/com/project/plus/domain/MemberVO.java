package com.project.plus.domain;

import java.math.BigDecimal;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MemberVO {
	private int memberNum;
	private String memberPhone;
	private String memberPic;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberNickname;
	private int memberPoint;
	private Date memberJoindate;
	private String memberMarketing;
	private BigDecimal memberLatitude;
	private BigDecimal  memberLongitude;
	
	
	
	
}
