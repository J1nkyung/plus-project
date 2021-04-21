package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;

public interface AdminMapper {
   
   public void deleteAdminInquiry(InquiryVO vo);

   public InquiryVO getAdminInquiry(InquiryVO vo);

   public List<InquiryVO> getAdminInquiryList(CriteriaMem cri) throws Exception;

   public int adminInquiryListCount(CriteriaMem cri) throws Exception;

   public int getAdminChart(MemberVO mvo);

   public int getAdminVisit(VisitCountVO vcvo);

   public int getAdminDayVisit(VisitCountVO vcvo);

   public int getVisit_1(VisitCountVO vcvo);

   public int getVisit_2(VisitCountVO vcvo);

   public int getVisit_3(VisitCountVO vcvo);

   public int getVisit_4(VisitCountVO vcvo);

   public int getVisit_5(VisitCountVO vcvo);

   public int getVisit_6(VisitCountVO vcvo);

   public int getCateStudy(ClubVO cvo);

   public int getCateExcer(ClubVO cvo);

   public int getCateHabit(ClubVO cvo);

   public int getCateHobby(ClubVO cvo);

   public int getJoinToday(MemberVO mvo);

   public int getJoin_1(MemberVO mvo);

   public int getJoin_2(MemberVO mvo);

   public int getJoin_3(MemberVO mvo);

   public int getJoin_4(MemberVO mvo);

   public int getJoin_5(MemberVO mvo);

   public int getJoin_6(MemberVO mvo);

   public int getOnStudy(ClubVO cvo);

   public int getOffStudy(ClubVO cvo);

   public int getOnExcer(ClubVO cvo);

   public int getOffExcer(ClubVO cvo);

   public int getOnHabit(ClubVO cvo);

   public int getOffHabit(ClubVO cvo);

   public int getOnHobby(ClubVO cvo);

   public int getOffHobby(ClubVO cvo);
   
   public int getPayToday(PaymentVO pvo);
   public int getPay_1(PaymentVO pvo);
   public int getPay_2(PaymentVO pvo);
   public int getPay_3(PaymentVO pvo);
   public int getPay_4(PaymentVO pvo);
   public int getPay_5(PaymentVO pvo);
   public int getPay_6(PaymentVO pvo);

   public InquiryVO answerInquiryForm(InquiryVO vo);

   public void answerInquiry(InquiryVO vo);

   public InquiryVO answerInquiryEditForm(InquiryVO vo);

   public void answerEditInquiry(InquiryVO vo);

   public List<PaymentVO> adminPayList(CriteriaMem cri) throws Exception;

   public int adminPayListCount(CriteriaMem cri) throws Exception;

   public void deleteAdminClub(ClubVO cvo);

   public List<ClubVO> adminClubList(CriteriaMem cri) throws Exception;

   public int adminClubListCount(CriteriaMem cri) throws Exception;

   public int adminClubListCount(ClubVO cvo);

//   public List<PaymentVO> payList(SearchCriteriaAdmin scad);
//   public int payListCount(SearchCriteriaAdmin scad);
}