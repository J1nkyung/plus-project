package com.project.plus.domain;

public class AnnounceVO {
	private int announceNum;
	private String announceTitle;
	private String announceContent;
	private String announceRegDate;
	public int getAnnounceNum() {
		return announceNum;
	}
	public void setAnnounceNum(int announceNum) {
		this.announceNum = announceNum;
	}
	public String getAnnounceTitle() {
		return announceTitle;
	}
	public void setAnnounceTitle(String announceTitle) {
		this.announceTitle = announceTitle;
	}
	public String getAnnounceContent() {
		return announceContent;
	}
	public void setAnnounceContent(String announceContent) {
		this.announceContent = announceContent;
	}
	public String getAnnounceRegDate() {
		return announceRegDate;
	}
	public void setAnnounceRegDate(String announceRegDate) {
		this.announceRegDate = announceRegDate;
	}
	@Override
	public String toString() {
		return "AnnounceVO [announceNum=" + announceNum + ", announceTitle=" + announceTitle + ", announceContent="
				+ announceContent + ", announceRegDate=" + announceRegDate + "]";
	}
	
	
}
