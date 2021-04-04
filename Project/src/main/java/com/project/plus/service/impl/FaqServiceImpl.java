package com.project.plus.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.plus.domain.FaqVO;
import com.project.plus.mapper.FaqMapper;
import com.project.plus.service.FaqService;

@Service("FaqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqMapper mapper;

	@Override
	public void insertFaq(FaqVO vo) {
		mapper.insertFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
		mapper.updateFaq(vo);
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		mapper.deleteFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {
		return mapper.getFaqList(vo);
	}
}
