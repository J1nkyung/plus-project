package com.project.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.plus.domain.FaqVO;
import com.project.plus.service.FaqService;

@Controller
//@SessionAttributes("faq")
public class FaqController {

	@Autowired
	FaqService faqService;
	
	// 자주묻는 질문 작성 폼
	@RequestMapping("/faqForm")
	public String faqForm(FaqVO vo) {
		return "faqForm.faq";
	}

	// 자주묻는 질문 작성 메서드
	@RequestMapping(value = "/insertFaq", method = RequestMethod.POST)
	public String insertFaq(FaqVO vo) throws Exception {
		faqService.insertFaq(vo);
		return "redirect:faq";
	}

	// 자주묻는 질문 수정 폼
	@RequestMapping("/editFaqForm")
	public String editFaqForm(FaqVO vo, Model model) {
		model.addAttribute("updateFaq", faqService.editFaqForm(vo));
		return "editFaqForm.faq";
	}

	// 자주묻는질문 수정 메서드
	@RequestMapping(value = "/updateFaq", method = RequestMethod.POST)
	public String updateFaq(FaqVO vo) { // @ModelAttribute("faq")
		faqService.updateFaq(vo);
		return "redirect:faq";
	}

	// 자주묻는 질문 삭제 메서드
	@RequestMapping("/deleteFaq")
	public String deleteFaq(FaqVO vo) {
		faqService.deleteFaq(vo);
		return "redirect:faq";
	}

	// 자주 묻는 질문 개별 글 조회
	@RequestMapping("/getFaq")
	public String getFaq(FaqVO vo, Model model) {
		model.addAttribute("faq", faqService.getFaq(vo));
		return "getFaq";
	}

	// 자주묻는 질문 전체 게시판 조회
	@RequestMapping("/faq")
	public String getFaqList(FaqVO vo, Model model, HttpSession session) {
		session.getAttribute("user");
		model.addAttribute("faqList", faqService.getFaqList(vo));
		return "faq.faq";
	}
}
