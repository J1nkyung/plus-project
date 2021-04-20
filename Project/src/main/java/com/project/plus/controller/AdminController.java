package com.project.plus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PageMakerMem;
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
      public String getAdminInquiryList(Model model, CriteriaMem cri) throws Exception {

         List<InquiryVO> adminInquiryList = ads.getAdminInquiryList(cri);
         System.out.println(adminInquiryList);
         model.addAttribute("adminInquiryList", adminInquiryList);

         PageMakerMem pgmad = new PageMakerMem();
         pgmad.setCriMem(cri);
         pgmad.setTotalCount(ads.adminInquiryListCount(cri));
         model.addAttribute("pageMakerMem", pgmad);

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
      
      // 회원 : 1:1 문의글 수정 폼
      @RequestMapping("/answerInquiryEditForm")
      public String answerInquiryEditForm(InquiryVO vo, Model model) {
         model.addAttribute("answerInquiryEditForm", ads.answerInquiryEditForm(vo));
         System.out.println("지금부터 수정을 시작하지" + vo);
         return "admin/inquiry/inquiryAnswerEditForm";
      }
      
      // 회원 : 1:1 문의글 수정 등록 메서드
      @RequestMapping(value = "/answerEditInquiry", method = RequestMethod.POST)
      public String answerEditInquiry(InquiryVO vo) {
         ads.answerEditInquiry(vo);
         System.out.println("수정제출"+vo);
         return "redirect:adminInquiry";
      }

   // 관리자 : 차트 페이지
   @RequestMapping("/adminChart")
   public String getAdminChart(ClubVO cvo, MemberVO mvo, VisitCountVO vcvo, Model model) {
      model.addAttribute("adminChart", ads.getAdminChart(mvo));
      model.addAttribute("adminTotalVisit", ads.getAdminVisit(vcvo));
      model.addAttribute("adminTodayVisit", ads.getAdminDayVisit(vcvo));
      model.addAttribute("getVisit_1", ads.getVisit_1(vcvo));
      model.addAttribute("getVisit_2", ads.getVisit_2(vcvo));
      model.addAttribute("getVisit_3", ads.getVisit_3(vcvo));
      model.addAttribute("getVisit_4", ads.getVisit_4(vcvo));
      model.addAttribute("getVisit_5", ads.getVisit_5(vcvo));
      model.addAttribute("getVisit_6", ads.getVisit_6(vcvo));
      model.addAttribute("getCateStudy", ads.getCateStudy(cvo));
      model.addAttribute("getCateExcer", ads.getCateExcer(cvo));
      model.addAttribute("getCateHabit", ads.getCateHabit(cvo));
      model.addAttribute("getCateHobby", ads.getCateHobby(cvo));
      model.addAttribute("getJoinToday", ads.getJoinToday(mvo));
      model.addAttribute("getJoin_1", ads.getJoin_1(mvo));
      model.addAttribute("getJoin_2", ads.getJoin_2(mvo));
      model.addAttribute("getJoin_3", ads.getJoin_3(mvo));
      model.addAttribute("getJoin_4", ads.getJoin_4(mvo));
      model.addAttribute("getJoin_5", ads.getJoin_5(mvo));
      model.addAttribute("getJoin_6", ads.getJoin_6(mvo));

      model.addAttribute("adminClubListCount", ads.adminClubListCount(cvo));
      
      model.addAttribute("getOnStudy", ads.getOnStudy(cvo));
      model.addAttribute("getOffStudy", ads.getOffStudy(cvo));
      model.addAttribute("getOnExcer", ads.getOnExcer(cvo));
      model.addAttribute("getOffExcer", ads.getOffExcer(cvo));
      model.addAttribute("getOnHabit", ads.getOnHabit(cvo));
      model.addAttribute("getOffHabit", ads.getOffHabit(cvo));
      model.addAttribute("getOnHobby", ads.getOnHobby(cvo));
      model.addAttribute("getOffHobby", ads.getOffHobby(cvo));

      return "/admin/charttest";
   }
   
//   // 관리자 : 모든 회원들의 결제내역 목록 조회
   @RequestMapping("/adminPay")
   public String adminPayList(CriteriaMem cri, Model model) throws Exception {
      List<PaymentVO> adminPayList = ads.adminPayList(cri);
      System.out.println(adminPayList);
      model.addAttribute("adminPayList",adminPayList);
      
      PageMakerMem pgmm = new PageMakerMem();
      pgmm.setCriMem(cri);
      pgmm.setTotalCount(ads.adminPayListCount(cri));
      model.addAttribute("pageMakerPay", pgmm);
      return "/admin/adminPayment";
   } 
   
   // 관리자 : 모든 회원들의 결제내역 목록 조회

   /*
    * @RequestMapping(value="/adminPay", method=RequestMethod.GET) public String
    * adminPayList(SearchCriteriaMem sc, Model model) throws Exception {
    * List<PaymentVO> adminPayList = ads.adminPayList(sc);
    * System.out.println(adminPayList);
    * model.addAttribute("adminPayList",adminPayList);
    * 
    * PageMakerAdmin pgmad = new PageMakerAdmin(); pgmad.setCriMem(sc);
    * pgmad.setTotalCount(ads.adminPayListCount(sc));
    * model.addAttribute("pageMakerPay", pgmad); return "/admin/adminPayment"; }
    */


   // 관리자 : 모든 모임 목록 조회   
   @RequestMapping("/adminClub")
   public String adminClubList(Model model, CriteriaMem cri) throws Exception {

      List<ClubVO> adminClubList = ads.adminClubList(cri);
      System.out.println(adminClubList);
      model.addAttribute("adminClubList", adminClubList);

      PageMakerMem pgmad = new PageMakerMem();
      pgmad.setCriMem(cri);
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