package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.FaqVO;
import com.project.plus.service.FaqService;

@Controller
@SessionAttributes("faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@RequestMapping("/insertFaq.do")
	public String insertFaq(FaqVO vo) throws Exception {
		faqService.insertFaq(vo);	
		return "getFaqList.do";
	}
	
	@RequestMapping("/updateFaq.do")
	public String updateFaq(@ModelAttribute("faq") FaqVO vo) {
		System.out.println(vo);
		faqService.updateFaq(vo);
		return "getFaqList.do";
	}
	
	@RequestMapping("/deleteFaq.do")
	public String deleteFaq(FaqVO vo) {
		faqService.deleteFaq(vo);
		return "getFaqList.do";
	}
	
	/*
	 * @RequestMapping("/getFaq.do") public String getFaq(FaqVO vo, Model model) {
	 * model.addAttribute("faq", faqService.getFaq(vo)); return "getFaq"; }
	 * 만들어 놓고 보니까 필요가 없더라고?
	 */
	
	@RequestMapping("/faq.do")
	public String getFaqList(FaqVO vo, Model model) {
		
		model.addAttribute("faqList", faqService.getFaqList(vo));
		return "faq";
	}
}
