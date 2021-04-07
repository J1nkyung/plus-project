package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.FaqVO;
import com.project.plus.domain.MemberVO;

public interface FaqService {
	void insertFaq(FaqVO vo);
	void updateFaq(FaqVO vo);
	void deleteFaq(FaqVO vo);
	FaqVO faqForm(FaqVO vo);
	FaqVO editFaqForm(FaqVO vo);
	Object getFaqList(FaqVO vo, MemberVO user);
	FaqVO getFaq(FaqVO vo);
	List<FaqVO> getFaqList(FaqVO vo);
}
