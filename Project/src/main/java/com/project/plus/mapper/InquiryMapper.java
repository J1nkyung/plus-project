package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.InquiryVO;

public interface InquiryMapper{
	
	void writeInquiry(InquiryVO vo);
	void editInquiry(InquiryVO vo);
	void answerInquiry(InquiryVO vo);
	void deleteInquiry(InquiryVO vo);
	InquiryVO getInquiry(InquiryVO vo);
	List<InquiryVO> getInquiryList(InquiryVO vo);
	List<InquiryVO> getInquiryPersonList(InquiryVO vo);
	List<InquiryVO> getInquiryTypeList(InquiryVO vo);
}
