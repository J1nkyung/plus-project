package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.FaqVO;
import com.project.plus.mapper.FaqMapper;
import com.project.plus.mapper.MainMapper;
import com.project.plus.service.FaqService;
import com.project.plus.service.MainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service("MainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;

	//메인 더하기 등록하기
	@Override
	public void insertClub(ClubVO vo) {
		mapper.insertClub(vo);
	}

	//메인 인기 더하기 리스트
	@Override
	public List<ClubVO> getListBest(ClubVO vo) {
		log.info(".......getListBest.......");
		return mapper.getListBest(vo);
	}

	// 메인 마감임박 더하기 리스트
	@Override
	public List<ClubVO> getListDeadline(ClubVO vo) {
		log.info(".......getListDeadline.......");
		return mapper.getListDeadline(vo);
	}

	//더하기 검색
	@Override
	public List<ClubVO> getListSearch(String keyword) {
		return mapper.getListSearch(keyword);
	}

}