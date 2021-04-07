package com.project.plus.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.domain.FaqVO;
import com.project.plus.domain.SearchCriteria;
import com.project.plus.mapper.FaqMapper;
import com.project.plus.mapper.MainMapper;
import com.project.plus.mapper.TotalListMapper;
import com.project.plus.service.FaqService;
import com.project.plus.service.MainService;
import com.project.plus.service.TotalListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service("TotalListService")
public class TotalListServiceImpl implements TotalListService {
	@Autowired
	private TotalListMapper mapper;
	
	
	/* 게시판 목록(페이징 적용) */

	public List<ClubVO> getListPaging(SearchCriteria scri) throws Exception  {
		List<ClubVO> list = null;
		list=mapper.getListPaging(scri);
		return list;
	}		
	/* 게시물 총 갯수 */

	public int getTotal(SearchCriteria scri) throws Exception   {
		return mapper.getTotal(scri);
	}		


}

