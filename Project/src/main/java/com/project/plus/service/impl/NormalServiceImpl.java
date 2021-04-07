package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ClubVO;
import com.project.plus.mapper.NormalMapper;
import com.project.plus.service.NormalService;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("NormalService")
public class NormalServiceImpl implements NormalService {

	@Autowired
	private NormalMapper mapper;

	@Override
	public List<ClubVO> getListNormal(ClubVO vo) {
		log.info(".......getListNormal.......");
		return mapper.getListNormal(vo);
	}

	@Override
	public List<ClubVO> getListNormalBest(ClubVO vo) {
		log.info(".......getListNormalBest.......");
		return mapper.getListNormalBest(vo);
	}



}