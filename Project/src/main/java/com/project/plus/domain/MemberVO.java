package com.project.plus.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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
	private String memberLatitude;
	private String memberLongitude;
	
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public Date getMemberJoindate() {
		return memberJoindate;
	}
	public void setMemberJoindate(Date memberJoindate) {
		this.memberJoindate = memberJoindate;
	}
	public String getMemberMarketing() {
		return memberMarketing;
	}
	public void setMemberMarketing(String memberMarketing) {
		this.memberMarketing = memberMarketing;
	}
	public String getMemberLatitude() {
		return memberLatitude;
	}
	public void setMemberLatitude(String memberLatitude) {
		this.memberLatitude = memberLatitude;
	}
	public String getMemberLongitude() {
		return memberLongitude;
	}
	public void setMemberLongitude(String memberLongitude) {
		this.memberLongitude = memberLongitude;
	}
	
	

	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", memberPhone=" + memberPhone + ", memberPic=" + memberPic
				+ ", memberEmail=" + memberEmail + ", memberName=" + memberName + ", memberNickname=" + memberNickname
				+ ", memberPoint=" + memberPoint + ", memberJoindate=" + memberJoindate + ", memberMarketing="
				+ memberMarketing + ", memberLatitude=" + memberLatitude + ", memberLongitude=" + memberLongitude + "]";
	}

	
	
	
}
