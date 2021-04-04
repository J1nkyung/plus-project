package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.service.AdminService;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.mapper.AdminMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper mapper;

	@Override
	public void deleteAdminInquiry(InquiryVO vo) {
		mapper.deleteAdminInquiry(vo);
	}
	
//	@Override
//	public void answerForm(InquiryVO vo) {
//		mapper.answerForm(vo);
//	}

	@Override
	public void answerInquiry(InquiryVO vo) {
		mapper.answerInquiry(vo);
	}
	
	@Override
	public InquiryVO getAdminInquiry(InquiryVO vo) {
		return mapper.getAdminInquiry(vo);
	}

	@Override
	public List<InquiryVO> getAdminInquiryList(InquiryVO vo) {
		return mapper.getAdminInquiryList(vo);
	}

	@Override
	public int getAdminChart(MemberVO mvo) {
		return mapper.getAdminChart(mvo);
		
	}



}
