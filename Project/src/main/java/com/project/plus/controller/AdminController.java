package com.project.plus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PageMakerAdmin;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;
import com.project.plus.service.AdminService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class AdminController {

	public static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService ads;
	// 관리자 : 1:1 문의글 상세 조회
		@GetMapping("/getAdminInquiry")
		public String getAdminInquiry(InquiryVO vo, Model model) {
			model.addAttribute("adminInquiry", ads.getAdminInquiry(vo));
			return "admin/inquiry/getAdminInquiry";
		}

		// 회원 : 1:1 문의 목록 조회 페이징처리 완
		@RequestMapping(value = "/adminInquiry")
		public String getAdminInquiryList(Model model, CriteriaAdmin cri) throws Exception {

			List<InquiryVO> adminInquiryList = ads.getAdminInquiryList(cri);
			System.out.println(adminInquiryList);
			model.addAttribute("adminInquiryList", adminInquiryList);

			PageMakerAdmin pgmad = new PageMakerAdmin();
			pgmad.setCri(cri);
			pgmad.setTotalCount(ads.adminInquiryListCount(cri));
			model.addAttribute("pageMakerAdmin", pgmad);

			return "admin/inquiry/adminInquiry";
		}

		// 관리자 : 1:1 문의글 삭제
		@RequestMapping("/deleteAdminInquiry")
		public String deleteAdminInquiry(InquiryVO vo) {
			ads.deleteAdminInquiry(vo);
			return "redirect:adminInquiry";
		}

		// 관리자 : 1:1 문의글 답변 폼
		@RequestMapping("/answerInquiryForm")
		public String answerInquiryForm(InquiryVO vo, Model model) {
			model.addAttribute("answerInquiryForm", ads.answerInquiryForm(vo));
			System.out.println("controller의 vo" + vo);
			return "admin/inquiry/inquiryAnswerForm";
		}

		// 관리자 : 1:1 문의글 답변 등록 메서드
		@RequestMapping("/answerInquiry")
		public String answerInquiry(InquiryVO vo) {
			ads.answerInquiry(vo);
			return "redirect:adminInquiry";
		}

	// 관리자 : 차트 페이지
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
	
	// 관리자 : 모든 회원들의 결제내역 목록 조회
	@RequestMapping("/adminPay")
	public String adminPayList(CriteriaAdmin cri, Model model) throws Exception {
		List<PaymentVO> adminPayList = ads.adminPayList(cri);
		System.out.println(adminPayList);
		model.addAttribute("adminPayList",adminPayList);
		
		PageMakerAdmin pgmad = new PageMakerAdmin();
		pgmad.setCri(cri);
		pgmad.setTotalCount(ads.adminPayListCount(cri));
		model.addAttribute("pageMakerPay", pgmad);
		return "adminPayment.adch";
	}

	// 관리자 : 모든 모임 목록 조회	
	@RequestMapping("/adminClub")
	public String adminClubList(Model model, CriteriaAdmin cri) throws Exception {

		List<ClubVO> adminClubList = ads.adminClubList(cri);
		System.out.println(adminClubList);
		model.addAttribute("adminClubList", adminClubList);

		PageMakerAdmin pgmad = new PageMakerAdmin();
		pgmad.setCri(cri);
		pgmad.setTotalCount(ads.adminClubListCount(cri));
		model.addAttribute("pageMakerClub", pgmad);

		return "/admin/adminClub";
	}
	
	// 관리자 : 모임 삭제
	@RequestMapping("/deleteAdminClub")
	public String deleteAdminClub(ClubVO cvo) {
		System.out.println("몇번 모임 삭제하는지 알려주세요" + cvo);
		ads.deleteAdminClub(cvo);
		return "redirect:adminClub";
	}

}
