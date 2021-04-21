package com.project.plus.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InquiryVO {
	private int inquiryNum;
	private int memberNum;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryType;
	private String inquiryState;
	private String inquiryAnswer;
	private String inquiryRegDate;
	private String inquiryAnswerDate;
	
	/* 추가로 필요한 부분 */
	private String memberEmail;
	private String memberNickname;

	
	
	
}
