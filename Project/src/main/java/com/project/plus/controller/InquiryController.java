package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.InquiryVO;
import com.project.plus.service.InquiryService;

@Controller
@SessionAttributes("inquiry")
public class InquiryController {

	@Autowired
	private InquiryService is;
	
	// return 어디로 할지가 아직 정리가 안됨

	@RequestMapping(value="/writeInquiry.do", method=RequestMethod.POST)
	public String writeInquiry(InquiryVO vo) throws Exception {
			is.writeInquiry(vo);
			return "inquiry.do";
	}

	@RequestMapping(value="/editInquiry.do", method=RequestMethod.POST)
	public String editInquiry(@ModelAttribute("inquiry")InquiryVO vo) {
		is.editInquiry(vo);
		return "inquiry/inquiryForm";
	}
	
//	@RequestMapping(value="/answerInquiry.do", method=RequestMethod.POST)
//	public String answerInquiry(@ModelAttribute("inquiry")InquiryVO vo) {
//		is.answerInquiry(vo);
//		return "inquiry.do";
//	}

	@RequestMapping("/deleteInquiry.do")
	public String deleteInquiry(InquiryVO vo) {
		is.deleteInquiry(vo);
		return "inquiry.do";
	}

//	@RequestMapping(value="/getInquiry.do", method=RequestMethod.GET)
//	public String getInquiry(InquiryVO vo, Model model) {
//		model.addAttribute("inquiry", is.getInquiry(vo));
//		return "inquiry/getInquiry";
//	}
	
	@GetMapping("/getInquiry.do")
	public String getInquiry(InquiryVO vo, Model model) {
		model.addAttribute("inquiry", is.getInquiry(vo));
		return "inquiry/getInquiry";
	}
	
	@RequestMapping("/inquiry.do")
	public String getInquiryList(InquiryVO vo, Model model) {
		model.addAttribute("inquiryList", is.getInquiryList(vo));
		return "inquiry.mypage";
	}
	
	@RequestMapping("/inquiryPerson.do")
	public String getInquiryPersonList(InquiryVO vo, Model model) {
		model.addAttribute("inquiryPersonList", is.getInquiryPersonList(vo));
		return "inquiry";
	}

	@RequestMapping("/inquiryType.do")
	public String getInquiryTypeList(InquiryVO vo, Model model) {
		model.addAttribute("inquiryTypeList", is.getInquiryTypeList(vo));
		return "inquiry"; // 1:1문의 리스트에 뿌려주는 것은 똑같기 때문에 여기다 돌려주는거 맞겠지..?
	}
}


