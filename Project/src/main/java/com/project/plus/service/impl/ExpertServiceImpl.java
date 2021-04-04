package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.FaqVO;
import com.project.plus.mapper.ExpertMapper;
import com.project.plus.mapper.FaqMapper;
import com.project.plus.mapper.MainMapper;
import com.project.plus.service.ExpertService;



import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service("ExpertService")
public class ExpertServiceImpl implements ExpertService {

	@Autowired
	private ExpertMapper mapper;

	@Override
	public List<ClubVO> getListExpert(ClubVO vo) {
		log.info(".......getListExpert.......");
		return mapper.getListExpert(vo);
	}

	@Override
	public List<ClubVO> getListExpertBest(ClubVO vo) {
		log.info(".......getListExpertBest.......");
		return mapper.getListExpertBest(vo);
	}



}