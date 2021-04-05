package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;
import com.project.plus.service.AdminService;

@Controller
//@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private AdminService ads;
	
	// 글 상세 조회
		@GetMapping("/getAdminInquiry")
		public String getAdminInquiry(InquiryVO vo, Model model) {
			model.addAttribute("adminInquiry", ads.getAdminInquiry(vo));
			return "getAdminInquiry.adinqu";
		}
		
		// 관리자용 모든 글 보기 : 게시판 목록 조회
		@RequestMapping("/adminInquiry")
		public String getAdminInquiryList(InquiryVO vo, Model model) {
			model.addAttribute("adminInquiryList", ads.getAdminInquiryList(vo));
			return "adminInquiry.adinqu";
		}
		
		// 문의글 삭제
		@RequestMapping("/deleteAdminInquiry")
		public String deleteAdminInquiry(InquiryVO vo) {
			ads.deleteAdminInquiry(vo);
			return "redirect:adminInquiry";
		}
		
		@RequestMapping("/adminChart")
		public String getAdminChart(MemberVO mvo, VisitCountVO vcvo, Model model) {
			model.addAttribute("adminChart", ads.getAdminChart(mvo));
			model.addAttribute("adminTotalVisit", ads.getAdminVisit(vcvo));
			model.addAttribute("adminTodayVisit", ads.getAdminDayVisit(vcvo));
			model.addAttribute("getVisit_1", ads.getVisit_1(vcvo));
			model.addAttribute("getVisit_2", ads.getVisit_2(vcvo));
			model.addAttribute("getVisit_3", ads.getVisit_3(vcvo));
			model.addAttribute("getVisit_4", ads.getVisit_4(vcvo));
			model.addAttribute("getVisit_5", ads.getVisit_5(vcvo));
			model.addAttribute("getVisit_6", ads.getVisit_6(vcvo));
			model.addAttribute("getCateStudy", ads.getCateStudy(vcvo));
			model.addAttribute("getCateExcer", ads.getCateExcer(vcvo));
			model.addAttribute("getCateHabit", ads.getCateHabit(vcvo));
			model.addAttribute("getCateHobby", ads.getCateHobby(vcvo));
			model.addAttribute("getJoinToday", ads.getJoinToday(mvo));
			model.addAttribute("getJoin_1", ads.getJoin_1(mvo));
			model.addAttribute("getJoin_2", ads.getJoin_2(mvo));
			model.addAttribute("getJoin_3", ads.getJoin_3(mvo));
			model.addAttribute("getJoin_4", ads.getJoin_4(mvo));
			model.addAttribute("getJoin_5", ads.getJoin_5(mvo));
			model.addAttribute("getJoin_6", ads.getJoin_6(mvo));
			return "charttest.adch";
		}


		@RequestMapping("/answerInquiryForm")
		public String answerInquiryForm(InquiryVO vo, Model model) {
			model.addAttribute("answerInquiryForm", ads.answerInquiryForm(vo));
			System.out.println("controller의 vo" + vo);
			return "inquiryAnswerForm.adinqu";
		}

		// 관리자용 : 답변 등록
		@RequestMapping("/answerInquiry")
		public String answerInquiry(InquiryVO vo) {
			ads.answerInquiry(vo);
			return "redirect:adminInquiry";
		}
		
		// 모든 결제 내역 보기 : 게시판 목록 조회
		@RequestMapping("/adminPay")
		public String adminPayList(PaymentVO pvo, Model model) {
			model.addAttribute("adminPayList", ads.adminPayList(pvo));
			return "adminPayment.adch";
		}
		
		// 모든 모임 보기 : 게시판 목록 조회
		@RequestMapping("/adminClub")
		public String adminClubList(ClubVO cvo, Model model) {
			model.addAttribute("adminClubList", ads.adminClubList(cvo));
			return "adminClub.adch";
		}
		
		// 모임 삭제
		@RequestMapping("/deleteAdminClub")
		public String deleteAdminClub(ClubVO cvo) {
			ads.deleteAdminClub(cvo);
			return "redirect:adminClub";
		}
		
//		@RequestMapping(value="/admin/adminInquiry")
//		public ModelAndView openBoardList(CriteriaAdmin criAd) throws Exception {
//		        
//		    ModelAndView mav = new ModelAndView("/admin/adminInquiry");
//		        
//		    PageMakerAdmin pmAd = new PageMakerAdmin();
//		    pmAd.setCriAd(criAd);
//		    pmAd.setTotalCount(100);
//		        
//		    List<Map<String,Object>> list = ads.getAdminInquiryList(criAd);
//		    mav.addObject("adminInquiryList", list);
//		    mav.addObject("pageMaker", pmAd);
//		        
//		    return mav;
//		        
//		}
}
