package com.project.plus.domain;

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
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getInquiryAnswerDate() {
		return inquiryAnswerDate;
	}
	public void setInquiryAnswerDate(String inquiryAnswerDate) {
		this.inquiryAnswerDate = inquiryAnswerDate;
	}
	
	
	public int getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}
	public String getInquiryState() {
		return inquiryState;
	}
	public void setInquiryState(String inquiryState) {
		this.inquiryState = inquiryState;
	}
	public String getInquiryAnswer() {
		return inquiryAnswer;
	}
	public void setInquiryAnswer(String inquiryAnswer) {
		this.inquiryAnswer = inquiryAnswer;
	}
	public String getInquiryRegDate() {
		return inquiryRegDate;
	}
	public void setInquiryRegDate(String inquiryRegDate) {
		this.inquiryRegDate = inquiryRegDate;
	}
	@Override
	public String toString() {
		return "InquiryVO [inquiryNum=" + inquiryNum + ", memberNum=" + memberNum + ", inquiryTitle=" + inquiryTitle
				+ ", inquiryContent=" + inquiryContent + ", inquiryType=" + inquiryType + ", inquiryState="
				+ inquiryState + ", inquiryAnswer=" + inquiryAnswer + ", inquiryRegDate=" + inquiryRegDate + ", inquiryAnswerDate=" + inquiryAnswerDate + ", memberEmail=" + memberEmail + ", memberNickname=" + memberNickname + "]";
	}
	
	
	
	
}
