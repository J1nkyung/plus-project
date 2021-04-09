package com.project.plus.domain;

import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;

/* Criteria
 * 특정 페이지 조회를 위한 클래스
 */
public class CriteriaBoardList {
		
		/* 현재 페이지 */
		private int page;
		
		/* 한 페이지 당 보여질 게시물 갯수 */
		private int perPageNum;

		/* 페이지 시작넘버 */
		private int rowStart;
		
		/* 페이지에서 끝나는넘버  */
		private int rowEnd;
		
		private int memberNum;

		private int clubNum;
		
		
		public int getMemberNum() {
			return memberNum;
		}


		public void setMemberNum(int memberNum) {
			this.memberNum = memberNum;
		}


		public int getClubNum() {
			return clubNum;
		}


		public void setClubNum(int clubNum) {
			this.clubNum = clubNum;
		}

		
		
		/* 검색 타입 배열 */
		private String[] typeArr;
		
		/* 기본 생성자 -> 기봅 세팅 : pageNum = 1, amount = 10 */
		public CriteriaBoardList() {
			this.page = 1;
			this.perPageNum = 10;
		}
		
		
		public void setPage(int page) {
			if(page <= 0) {
				this.page = 1;
				return ;
			}
			this.page = page;
		}
		
		public void setPerPageNum(int perPageNum) {
			if(perPageNum <= 0 || perPageNum >100) {
				this.perPageNum=10;
				return ;
			}
			this.perPageNum=perPageNum;
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
			return "CriteriaMem [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
					+ "]";
		}
		
		
		
	}