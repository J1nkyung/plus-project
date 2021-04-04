package com.project.plus.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerMem {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;
	private CriteriaMem cmem;
	
	public void setCriMem(CriteriaMem cmem) {
		this.cmem = cmem;
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
	
	public CriteriaMem getCriMem() {
		return cmem;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(cmem.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cmem.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cmem.getPerPageNum() >= totalCount ? false : true;
	}
	
	//주소창에 목록번호, 나열갯수 표시해주는 부분 
	public String makeQuery(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", cmem.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}
	
	//검색할 때 page, perPageNum, searchType, keyword를 url로 사용할수 있게 하기 위해 만든 메서드
	public String makeSearch(int page) {
		
		UriComponents uriComponents = 
		UriComponentsBuilder.newInstance().queryParam("page", page)
								          .queryParam("perPageNum", cmem.getPerPageNum())
								          .queryParam("searchType", ((SearchCriteriaMem)cmem).getSearchType())
								          .queryParam("keyword", encoding(((SearchCriteriaMem)cmem).getKeyword()))
								          .build(); 
			return uriComponents.toUriString();  
	}
	
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) { 
			return "";
		}
		 
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) { 
			return ""; 
		}
	}
}