package com.project.plus.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.InquiryVO;

public interface InquiryService {
	
	void writeInquiry(InquiryVO vo);

	void editInquiry(InquiryVO vo);
	
	void answerInquiry(InquiryVO vo);

	void deleteInquiry(InquiryVO vo);

	InquiryVO getInquiry(InquiryVO vo);

	List<InquiryVO> getInquiryList(InquiryVO vo);
	
	List<InquiryVO> getInquiryPersonList(InquiryVO vo);
	
	List<InquiryVO> getInquiryTypeList(InquiryVO vo);
	
}