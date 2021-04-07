<<<<<<< HEAD
package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;
import com.project.plus.mapper.InquiryMapper;
import com.project.plus.service.InquiryService;

@Service("InquiryService")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryMapper mapper;
	
	// 회원 : 1:1 문의글 작성 폼
	@Override
	public void inquiryForm(InquiryVO vo) {
		mapper.inquiryForm(vo);
	}
	
	// 회원 : 1:1 문의글 제출 메서드
	@Override
	public void writeInquiry(InquiryVO vo) {
		mapper.writeInquiry(vo);
	}
	
	// 회원 : 1:1 문의글 수정 폼
	public InquiryVO editInquiryForm(InquiryVO vo) {
		return mapper.editInquiryForm(vo);
	}
	
	// 회원 : 1:1 문의글 수정 등록 메서드
	@Override
	public void editInquiry(InquiryVO vo) {
		mapper.editInquiry(vo);
	}

	// 회원 : 1:1 문의글 삭제 메서드
	@Override
	public void deleteInquiry(InquiryVO vo) {
		mapper.deleteInquiry(vo);
	}

	// 회원 : 1:1 문의글 개별 조회  
	@Override
	public InquiryVO getInquiry(InquiryVO vo) {
		return mapper.getInquiry(vo);
	}

	// 회원 : 1:1 문의 목록 조회 페이징처리 완
	@Override
	public List<InquiryVO> getInquiryList(CriteriaAdmin cri) throws Exception {
		return mapper.getInquiryList(cri);
	}

	// 페이징 전 개수 세는 메서드
	@Override
	public int inquiryListCount(CriteriaAdmin cri) throws Exception {
		return mapper.inquiryListCount(cri);
	}

}
=======
package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;
import com.project.plus.mapper.InquiryMapper;
import com.project.plus.service.InquiryService;

@Service("InquiryService")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryMapper mapper;
	
	// 회원 : 1:1 문의글 작성 폼
	@Override
	public void inquiryForm(InquiryVO vo) {
		mapper.inquiryForm(vo);
	}
	
	// 회원 : 1:1 문의글 제출 메서드
	@Override
	public void writeInquiry(InquiryVO vo) {
		mapper.writeInquiry(vo);
	}
	
	// 회원 : 1:1 문의글 수정 폼
	public InquiryVO editInquiryForm(InquiryVO vo) {
		return mapper.editInquiryForm(vo);
	}
	
	// 회원 : 1:1 문의글 수정 등록 메서드
	@Override
	public void editInquiry(InquiryVO vo) {
		mapper.editInquiry(vo);
	}

	// 회원 : 1:1 문의글 삭제 메서드
	@Override
	public void deleteInquiry(InquiryVO vo) {
		mapper.deleteInquiry(vo);
	}

	// 회원 : 1:1 문의글 개별 조회  
	@Override
	public InquiryVO getInquiry(InquiryVO vo) {
		return mapper.getInquiry(vo);
	}

	// 회원 : 1:1 문의 목록 조회 페이징처리 완
	@Override
	public List<InquiryVO> getInquiryList(CriteriaAdmin cri) throws Exception {
		return mapper.getInquiryList(cri);
	}

	// 페이징 전 개수 세는 메서드
	@Override
	public int inquiryListCount(CriteriaAdmin cri) throws Exception {
		return mapper.inquiryListCount(cri);
	}

}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
