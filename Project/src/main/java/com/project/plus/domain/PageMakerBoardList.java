package com.project.plus.domain;


import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerBoardList {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;
	private CriteriaBoardList cb;
	
	
	
	public void setCb(CriteriaBoardList cb) {
		this.cb = cb;
	}
	public void getCb(CriteriaBoardList cb) {
		this.cb = cb;
	}
	

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	

	private void calcData() {
		endPage = (int) (Math.ceil(cb.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cb.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cb.getPerPageNum() >= totalCount ? false : true;
	}
	
	//주소창에 목록번호, 나열갯수 표시해주는 부분 
	public String makeQuery(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
							.queryParam("clubNum", cb.getClubNum())
							.queryParam("memberNum", cb.getMemberNum())
						    .queryParam("page", page)
							.queryParam("perPageNum", cb.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}
}