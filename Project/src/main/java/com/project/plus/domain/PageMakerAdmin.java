//package com.project.plus.domain;
//
//public class PageMakerAdmin {
//	private CriteriaAdmin criAd;
//	private int totalCount;	//총 게시글 수
//	private int startPage;	// 화면에 보여질 첫번째 페이지 번호, 시작 페이지 번호
//	private int endPage;	// 화면에 보여질 마지막 페이지 번호, 끝 페이지 번호
//	private boolean prev;	// 이전 버튼 생성 여부
//	private boolean next;	// 다음 버튼 생성 여부
//	private int displayPageNum = 5;	// 화면 하단에 보여지는 페이지 버튼의 수
//
//	public CriteriaAdmin getCriAd() {
//		return criAd;
//	}
//
//	public void setCriAd(CriteriaAdmin criAd) {
//		this.criAd = criAd;
//	}
//
//	public int getTotalCount() {
//		return totalCount;
//	}
//
//	public void setTotalCount(int totalCount) {
//		this.totalCount = totalCount;
//		calcData();	// 총 게시글 수를 셋팅할 때 calcData() 메서드를 호출하여 페이징 관련 버튼 계산을 한다
//	}
//
//	private void calcData() {	// 페이징의 버튼들을 생성하는 계산식. 끝 페이지 번호, 시작 페이지 번호, 이전, 다음 버튼 들을 구한다
//		// criAd.getPage() : 현재 페이지 번호
//		// criAd.getPerPageNum() : 한 페이지 당 보여줄 게시글의 갯수
//	
//		// 끝 페이지 번호 = (현재 페이지 번호/ 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수
//		endPage = (int) (Math.ceil(criAd.getPage() / (double) displayPageNum) * displayPageNum);
//
//		startPage = (endPage - displayPageNum) + 1;
//		if (startPage <= 0)
//			startPage = 1;
//
//		// 마지막 페이지 번호 = 총 게시글 수 / 한 페이지 당 보여줄 게시글의 갯수
//		int tempEndPage = (int) (Math.ceil(totalCount / (double) criAd.getPerPageNum()));
//		if (endPage > tempEndPage) {
//			endPage = tempEndPage;
//		}
//
//		prev = startPage == 1 ? false : true;	// 이전 버튼은 시작 페이지 번호가 1이 아니면 생기면 된다
//		next = endPage * criAd.getPerPageNum() < totalCount ? true : false; // 다음 버튼 생성 여부 = 끝 페이지 번호  * 한 페이지당 보여줄 게시글의 개수
//
//	}
//
//	public int getStartPage() {
//		return startPage;
//	}
//
//	public void setStartPage(int startPage) {
//		this.startPage = startPage;
//	}
//
//	public int getEndPage() {
//		return endPage;
//	}
//
//	public void setEndPage(int endPage) {
//		this.endPage = endPage;
//	}
//
//	public boolean isPrev() {
//		return prev;
//	}
//
//	public void setPrev(boolean prev) {
//		this.prev = prev;
//	}
//
//	public boolean isNext() {
//		return next;
//	}
//
//	public void setNext(boolean next) {
//		this.next = next;
//	}
//
//	public int getDisplayPageNum() {
//		return displayPageNum;
//	}
//
//	public void setDisplayPageNum(int displayPageNum) {
//	        this.displayPageNum = displayPageNum;
//	    }
//}
