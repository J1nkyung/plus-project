package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.FaqVO;

public interface FaqService {
	
	void insertFaq(FaqVO vo);
	void updateFaq(FaqVO vo);
	void deleteFaq(FaqVO vo);
	List<FaqVO> getFaqList(FaqVO vo);
}
