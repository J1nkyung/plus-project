package com.project.plus.domain;

public class VisitCountVO {
	private String vDate;

	public String getvDate() {
		return vDate;
	}

	public void setvDate(String vDate) {
		this.vDate = vDate;
	}

	@Override
	public String toString() {
		return "VisitCountVO [vDate=" + vDate + "]";
	}
	
	
}
