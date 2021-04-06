package com.project.plus.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerAdmin {
	private CriteriaAdmin cri;
	private int totalCount; // 총 게시글 수
	private int startPage; // 화면에 보여질 첫번째 페이지 번호, 시작 페이지 번호
	private int endPage; // 화면에 보여질 마지막 페이지 번호, 끝 페이지 번호
	private boolean prev; // 이전 버튼 생성 여부
	private boolean next; // 다음 버튼 생성 여부
	private int displayPageNum = 5; // 화면 하단에 보여지는 페이지 버튼의 수

	public void setCri(CriteriaAdmin cri) {
		this.cri = cri;
	}
	
	public CriteriaAdmin getCri() {
		return cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData(); // 총 게시글 수를 셋팅할 때 calcData() 메서드를 호출하여 페이징 관련 버튼 계산을 한다
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
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();

		return uriComponents.toUriString();
	}

}
