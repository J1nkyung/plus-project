package com.project.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.InquiryService;

@Controller
@SessionAttributes("inquiry")
public class InquiryController {

	@Autowired
	private InquiryService is;
	
	@RequestMapping(value = "/inquiryForm", method = RequestMethod.GET)
	public String inquiryForm(InquiryVO vo, MemberVO mvo, HttpSession session) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setMemberNum(user.getMemberNum());
		is.inquiryForm(vo);
		System.out.println("inquiryForm" + vo);
		return "inquiryForm.inqu";
	}

	@RequestMapping(value = "/writeInquiry", method = RequestMethod.POST)
	public String writeInquiry(InquiryVO vo) throws Exception {
		is.writeInquiry(vo);
		return "redirect:inquiry";
	}

	@RequestMapping("/editInquiryForm")
	public String editInquiryForm(InquiryVO vo, Model model) {
		model.addAttribute("inquiryForm", is.editInquiryForm(vo));
		return "inquiryEditForm.inqu";
	}

	@RequestMapping(value = "/editInquiry", method = RequestMethod.POST)
	public String editInquiry(InquiryVO vo) {
		is.editInquiry(vo);
		return "redirect:inquiry";
	}

	@RequestMapping("/deleteInquiry")
	public String deleteInquiry(InquiryVO vo) {
		is.deleteInquiry(vo);
		return "redirect:inquiry";
	}

	@GetMapping("/getInquiry")
	public String getInquiry(InquiryVO vo, Model model) {
		model.addAttribute("inquiry", is.getInquiry(vo));
		return "getInquiry.inqu";
	}

	@RequestMapping("/inquiry")
	public String getInquiryList(InquiryVO vo, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setMemberNum(user.getMemberNum());
		model.addAttribute("inquiryList", is.getInquiryList(vo));
		return "inquiry.inqu";
	}
}


