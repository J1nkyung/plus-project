package com.project.plus.domain;

import java.math.BigDecimal;
import java.util.Arrays;

import lombok.ToString;

@ToString
public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String keyword = "";
	
	private BigDecimal memberLatitude;
	private BigDecimal  memberLongitude;
	
	
	

	public BigDecimal getMemberLatitude() {
		return memberLatitude;
	}
	public void setMemberLatitude(BigDecimal memberLatitude) {
		this.memberLatitude = memberLatitude;
	}
	public BigDecimal getMemberLongitude() {
		return memberLongitude;
	}
	public void setMemberLongitude(BigDecimal memberLongitude) {
		this.memberLongitude = memberLongitude;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]" ;
	}

	
}