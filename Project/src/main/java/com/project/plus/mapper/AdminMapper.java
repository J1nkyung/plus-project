package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;

public interface AdminMapper {
	public void deleteAdminInquiry(InquiryVO vo);
//	public void answerForm(InquiryVO vo);
	InquiryVO answerInquiry(InquiryVO vo);
	public InquiryVO getAdminInquiry(InquiryVO vo);
	List<InquiryVO> getAdminInquiryList(InquiryVO vo);
	public int getAdminChart(MemberVO mvo);
}
