package com.project.plus.domain;

public class CriteriaAdmin {
	private int page;		// 현재 페이지 번호
	private int perPageNum;	// 한 페이지 당 보여줄 게시글의 개수
	private int rowStart;
	private int rowEnd;
	private int memberNum;
	
	/* 검색어 키워드 */
	private String keyword;
	
	/* 검색 타입 */
	private String type;
	private String clubName;
	private String memberNickame;
	private String payMethod;
//	private String payDate;
	
	/* 검색 타입 배열 */
	private String[] typeArr;
	
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public String getMemberNickame() {
		return memberNickame;
	}

	public void setMemberNickame(String memberNickame) {
		this.memberNickame = memberNickame;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public CriteriaAdmin() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "CriteriaAdmin [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd + ", memberNum=" + memberNum
				+ "]";
	}

}
