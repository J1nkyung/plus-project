package com.project.plus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PageMakerAdmin;
import com.project.plus.service.InquiryService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class InquiryController {
	
	public static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
	
	@Autowired
	private InquiryService is;
	
	// 회원 : 1:1 문의글 작성 폼
	@RequestMapping(value = "/inquiryForm", method = RequestMethod.GET)
	public String inquiryForm(InquiryVO vo, MemberVO mvo, HttpSession session) throws Exception {
		/*
		 * MemberVO user = (MemberVO) session.getAttribute("user");
		 * vo.setMemberNum(user.getMemberNum()); is.inquiryForm(vo);
		 * System.out.println("inquiryForm" + vo);
		 */
		return "inquiryForm.inqu";
	}

	// 회원 : 1:1 문의글 제출 메서드
	@RequestMapping(value = "/writeInquiry", method = RequestMethod.POST)
	public String writeInquiry(InquiryVO vo) throws Exception {
		is.writeInquiry(vo);
		return "redirect:inquiry";
	}

	// 회원 : 1:1 문의글 수정 폼
	@RequestMapping("/editInquiryForm")
	public String editInquiryForm(InquiryVO vo, Model model) {
		model.addAttribute("inquiryForm", is.editInquiryForm(vo));
		return "inquiryEditForm.inqu";
	}

	// 회원 : 1:1 문의글 수정 등록 메서드
	@RequestMapping(value = "/editInquiry", method = RequestMethod.POST)
	public String editInquiry(InquiryVO vo) {
		is.editInquiry(vo);
		return "redirect:inquiry";
	}

	// 회원 : 1:1 문의글 삭제 메서드
	@RequestMapping("/deleteInquiry")
	public String deleteInquiry(InquiryVO vo) {
		is.deleteInquiry(vo);
		return "redirect:inquiry";
	}

	// 회원 : 1:1 문의글 개별 조회  
	@GetMapping("/getInquiry")
	public String getInquiry(InquiryVO vo, Model model) {
		model.addAttribute("inquiry", is.getInquiry(vo));
		return "getInquiry.inqu";
	}
	
	// 회원 : 1:1 문의 목록 조회 페이징처리 완
	@RequestMapping(value="/inquiry", method=RequestMethod.GET)
	public String getInquiryList(Model model, HttpSession session, CriteriaAdmin cri) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		cri.setMemberNum(user.getMemberNum());
		
		List<InquiryVO> inquiryList = is.getInquiryList(cri);
		System.out.println(inquiryList);
		model.addAttribute("inquiryList", inquiryList);
		
		PageMakerAdmin pgmad = new PageMakerAdmin();
		pgmad.setCri(cri);
		pgmad.setTotalCount(is.inquiryListCount(cri));
		model.addAttribute("pageMakerAdmin", pgmad);
		
		return "inquiry.inqu";
	}

}
