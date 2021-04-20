package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;

public interface AdminService {
   
   InquiryVO answerInquiryForm(InquiryVO vo);
   void answerInquiry(InquiryVO vo);
   InquiryVO answerInquiryEditForm(InquiryVO vo);
   void answerEditInquiry(InquiryVO vo);
   void deleteAdminInquiry(InquiryVO vo);

   InquiryVO getAdminInquiry(InquiryVO vo);
   public List<InquiryVO> getAdminInquiryList(CriteriaMem cri) throws Exception;
   public int adminInquiryListCount(CriteriaMem cri) throws Exception;
   
   int getAdminChart(MemberVO mvo);
   
   int getAdminVisit(VisitCountVO vcvo);
   
   int getAdminDayVisit(VisitCountVO vcvo);
   
   int getVisit_1(VisitCountVO vcvo);
   int getVisit_2(VisitCountVO vcvo);
   int getVisit_3(VisitCountVO vcvo);
   int getVisit_4(VisitCountVO vcvo);
   int getVisit_5(VisitCountVO vcvo);
   int getVisit_6(VisitCountVO vcvo);
   
   int getCateStudy(ClubVO cvo);
   int getCateExcer(ClubVO cvo);
   int getCateHabit(ClubVO cvo);
   int getCateHobby(ClubVO cvo);
   
   int getJoinToday(MemberVO mvo);
   int getJoin_1(MemberVO mvo);
   int getJoin_2(MemberVO mvo);
   int getJoin_3(MemberVO mvo);
   int getJoin_4(MemberVO mvo);
   int getJoin_5(MemberVO mvo);
   int getJoin_6(MemberVO mvo);
   
   int getOnStudy(ClubVO cvo);
   int getOffStudy(ClubVO cvo);
   int getOnExcer(ClubVO cvo);
   int getOffExcer(ClubVO cvo);
   int getOnHabit(ClubVO cvo);
   int getOffHabit(ClubVO cvo);
   int getOnHobby(ClubVO cvo);
   int getOffHobby(ClubVO cvo);
   

   public List<PaymentVO> adminPayList(CriteriaMem cri) throws Exception;
   public int adminPayListCount(CriteriaMem cri) throws Exception;
   
   /*
    * public List<PaymentVO> adminPayList(SearchCriteriaAdmin cri) throws
    * Exception; public int adminPayListCount(SearchCriteriaAdmin cri) throws
    * Exception;
    */
   
   void deleteAdminClub(ClubVO cvo);

   public List<ClubVO> adminClubList(CriteriaMem cri) throws Exception;
   public int adminClubListCount(CriteriaMem cri) throws Exception;
   int adminClubListCount(ClubVO cvo);
   
//   public List<PaymentVO> payList(SearchCriteriaAdmin scad);
//   public int payListCount(SearchCriteriaAdmin scad);
   
}