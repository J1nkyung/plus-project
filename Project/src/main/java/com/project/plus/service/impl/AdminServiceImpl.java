package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;
import com.project.plus.mapper.AdminMapper;
import com.project.plus.service.AdminService;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

   @Autowired
   AdminMapper mapper;

   @Override
   public InquiryVO getAdminInquiry(InquiryVO vo) {
      return mapper.getAdminInquiry(vo);
   }
   
   @Override
   public List<InquiryVO> getAdminInquiryList(CriteriaMem cri) throws Exception {
      return mapper.getAdminInquiryList(cri);
   }
   
   @Override
   public int adminInquiryListCount(CriteriaMem cri) throws Exception {
      return mapper.adminInquiryListCount(cri);
   }

   @Override
   public void deleteAdminInquiry(InquiryVO vo) {
      mapper.deleteAdminInquiry(vo);
   }
   
   @Override
   public void answerInquiry(InquiryVO vo) {
      mapper.answerInquiry(vo);
   }
   
   @Override
   public InquiryVO answerInquiryForm(InquiryVO vo) {
      return mapper.answerInquiryForm(vo);
   }


   @Override
   public int getAdminChart(MemberVO mvo) {
      return mapper.getAdminChart(mvo);
   }
   
   @Override
   public int getAdminVisit(VisitCountVO vcvo) {
      return mapper.getAdminVisit(vcvo);
   }
   
   @Override
   public int getAdminDayVisit(VisitCountVO vcvo) {
      return mapper.getAdminDayVisit(vcvo);
   }

   @Override
   public int getVisit_1(VisitCountVO vcvo) {
      return mapper.getVisit_1(vcvo);
   }


   @Override
   public int getVisit_2(VisitCountVO vcvo) {
      return mapper.getVisit_2(vcvo);
   }


   @Override
   public int getVisit_3(VisitCountVO vcvo) {
      return mapper.getVisit_3(vcvo);
   }


   @Override
   public int getVisit_4(VisitCountVO vcvo) {
      return mapper.getVisit_4(vcvo);
   }


   @Override
   public int getVisit_5(VisitCountVO vcvo) {
      return mapper.getVisit_5(vcvo);
   }


   @Override
   public int getVisit_6(VisitCountVO vcvo) {
      return mapper.getVisit_6(vcvo);
   }

   @Override
   public int getCateStudy(ClubVO cvo) {
      return mapper.getCateStudy(cvo);
   }

   @Override
   public int getCateExcer(ClubVO cvo) {
      return mapper.getCateExcer(cvo);
   }

   @Override
   public int getCateHabit(ClubVO cvo) {
      return mapper.getCateHabit(cvo);
   }

   @Override
   public int getCateHobby(ClubVO cvo) {
      return mapper.getCateHobby(cvo);
   }
   
   
   @Override
   public int getJoinToday(MemberVO mvo) {
      return mapper.getJoinToday(mvo);
   }

   @Override
   public int getJoin_1(MemberVO mvo) {
      return mapper.getJoin_1(mvo);
   }

   @Override
   public int getJoin_2(MemberVO mvo) {
      return mapper.getJoin_2(mvo);
   }

   @Override
   public int getJoin_3(MemberVO mvo) {
      return mapper.getJoin_3(mvo);
   }

   @Override
   public int getJoin_4(MemberVO mvo) {
      return mapper.getJoin_4(mvo);
   }

   @Override
   public int getJoin_5(MemberVO mvo) {
      return mapper.getJoin_5(mvo);
   }

   @Override
   public int getJoin_6(MemberVO mvo) {
      return mapper.getJoin_6(mvo);
   }

   @Override
   public List<PaymentVO> adminPayList(CriteriaMem cri) throws Exception {
      return mapper.adminPayList(cri);
   }
   
   @Override
   public int adminPayListCount(CriteriaMem cri) throws Exception {
      return mapper.adminPayListCount(cri);
   }
   
//   @Override
//   public List<PaymentVO> adminPayList(SearchCriteriaAdmin scad) throws Exception {
//      List<PaymentVO> list = null;
//      list = mapper.adminPayList(scad);
//      return list;
//   }
//   
//   @Override
//   public int adminPayListCount(SearchCriteriaAdmin scad) throws Exception {
//      return mapper.adminPayListCount(scad);
//   }

   @Override
   public void deleteAdminClub(ClubVO cvo) {
      mapper.deleteAdminClub(cvo);
      
   }

   @Override
   public List<ClubVO> adminClubList(CriteriaMem cri) throws Exception {
      return mapper.adminClubList(cri);
   }

   @Override
   public int adminClubListCount(CriteriaMem cri) throws Exception {
      System.out.println("criteria의 int가 사용됨");
      return mapper.adminClubListCount(cri);
   }

   @Override
   public int adminClubListCount(ClubVO cvo) {
      System.out.println("clubVO의 int가 사용됨");
      return mapper.adminClubListCount(cvo);
   }

   @Override
   public InquiryVO answerInquiryEditForm(InquiryVO vo) {
      return mapper.answerInquiryEditForm(vo);
   }

   @Override
   public void answerEditInquiry(InquiryVO vo) {
      mapper.answerEditInquiry(vo);
   }

   @Override
   public int getOnStudy(ClubVO cvo) {
      return mapper.getOnStudy(cvo);
   }

   @Override
   public int getOffStudy(ClubVO cvo) {
      return mapper.getOffStudy(cvo);
   }

   @Override
   public int getOnExcer(ClubVO cvo) {
      return mapper.getOnExcer(cvo);
   }

   @Override
   public int getOffExcer(ClubVO cvo) {
      return mapper.getOffExcer(cvo);
   }

   @Override
   public int getOnHabit(ClubVO cvo) {
      return mapper.getOnHabit(cvo);
   }

   @Override
   public int getOffHabit(ClubVO cvo) {
      return mapper.getOffHabit(cvo);
   }

   @Override
   public int getOnHobby(ClubVO cvo) {
      return mapper.getOnHobby(cvo);
   }

   @Override
   public int getOffHobby(ClubVO cvo) {
      return mapper.getOffHobby(cvo);
   }

   @Override
   public int getPayToday(PaymentVO pvo) {
      return mapper.getPayToday(pvo);
   }

   @Override
   public int getPay_1(PaymentVO pvo) {
      return mapper.getPay_1(pvo);
   }

   @Override
   public int getPay_2(PaymentVO pvo) {
      return mapper.getPay_2(pvo);
   }

   @Override
   public int getPay_3(PaymentVO pvo) {
      return mapper.getPay_3(pvo);
   }

   @Override
   public int getPay_4(PaymentVO pvo) {
      return mapper.getPay_4(pvo);
   }

   @Override
   public int getPay_5(PaymentVO pvo) {
      return mapper.getPay_5(pvo);
   }

   @Override
   public int getPay_6(PaymentVO pvo) {
      return mapper.getPay_6(pvo);
   }

//   @Override
//   public List<PaymentVO> payList(SearchCriteriaAdmin scad) {
//      List<PaymentVO> list = null;
//      list = mapper.payList(scad);
//      return list;
//   }

//   @Override
//   public int payListCount(SearchCriteriaAdmin scad) {
//      return mapper.payListCount(scad);
//   }

}