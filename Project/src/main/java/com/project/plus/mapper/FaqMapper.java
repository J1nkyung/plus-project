package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.FaqVO;

public interface FaqMapper {
	void insertFaq(FaqVO vo);
	void updateFaq(FaqVO vo);
	void deleteFaq(FaqVO vo);
	FaqVO getFaq(FaqVO vo);
	List<FaqVO> getFaqList(FaqVO vo);
	FaqVO editFaqForm(FaqVO vo);
	FaqVO faqForm(FaqVO vo);
}