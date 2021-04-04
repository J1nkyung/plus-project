package com.project.plus.domain;



import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;

/* Criteria
 * 특정 페이지 조회를 위한 클래스
 */
public class Criteria {

	/* 현재 페이지 */
	private int pageNum;

	/* 한 페이지 당 보여질 게시물 갯수 */
	private int amount;

	/* 페이지 시작 넘버 */
	private int rowStart;

	/* 페이지에서 끝나는 넘버 */
	private int rowEnd;

	/* 검색어 키워드 */
	private String keyword;
	
	/* 검색 타입 */
	private String type;

	
	/* 검색 타입 배열 */
	private String[] typeArr;

	/* 기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 20 */
	public Criteria() {
		this.pageNum = 1;
		this.amount = 20;
	
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.pageNum = 1;
			return;
		}
		this.pageNum = page;
	}

	public void setAmount(int amount) {
		if (amount <= 0 || amount > 100) {
			this.amount = 20;
			return;
		}
		this.amount = amount;
	}

	public int getPage() {
		return pageNum;
	}

	public int getPageStart() {
		return (this.pageNum - 1) * amount;
	}

	public int getPerPageNum() {
		return this.amount;
	}

	public int getRowStart() {
		rowStart = ((pageNum - 1) * amount) + 1;
		return rowStart;
	}

	public int getRowEnd() {
		rowEnd = rowStart + amount - 1;
		return rowEnd;
	}

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
		this.typeArr = type.split("");
	}
	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ ", keyword=" + keyword + ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]";
	}



}