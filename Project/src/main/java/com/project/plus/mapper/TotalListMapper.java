package com.project.plus.mapper;

import java.util.List;
import java.util.Map;


import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.domain.SearchCriteria;


public interface TotalListMapper {
	/* 게시판 목록(페이징 적용) */
	public List<ClubVO> getListPaging(SearchCriteria scri) throws Exception;

	/* 게시판 총 갯수 */
	public int getTotal(SearchCriteria scri) throws Exception;
}