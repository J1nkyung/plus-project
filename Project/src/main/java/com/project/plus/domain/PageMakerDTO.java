package com.project.plus.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerDTO {
	/*전체 게시물 수*/
	private int totalCount;
	/* 시작 페이지 */
	private int startPage;
	/* 끝 페이지 */
	private int endPage;
	/* 이전 페이지, 다음 페이지 존재유무 */
	private boolean prev, next;
	/*하단 페이징 나타내는 갯수*/
	private int displayPageNum = 5;
	/* 현재 페이지, 페이지당 게시물 표시수 정보 */
	private Criteria cri;
	
	
	public void setCriteria(Criteria cri) {
		this.cri = cri;
	}
	public Criteria getCriteria() {
		return cri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
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
/*페이징 계산함수*/
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	//주소창에 목록번호, 나열갯수 표시해주는 부분 
		public String makeQuery(int page) {
			UriComponents uriComponents =
			UriComponentsBuilder.newInstance()
							    .queryParam("page", page)
								.queryParam("perPageNum", cri.getPerPageNum())
								.build();
			   
			return uriComponents.toUriString();
		}
		public String makeSearch(int page)
		{
		  
		 UriComponents uriComponents =
		            UriComponentsBuilder.newInstance()
		            .queryParam("page", page)
		            .queryParam("perPageNum", cri.getPerPageNum()) 
		            .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
		            .queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
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

	
	

