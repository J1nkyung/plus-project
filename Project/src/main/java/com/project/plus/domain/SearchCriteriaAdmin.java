package com.project.plus.domain;

public class SearchCriteriaAdmin extends CriteriaAdmin{
	
	private String searchType = "";
	private String keyword ="";
	
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
		return "SearchCriteriaAdmin [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	

}
