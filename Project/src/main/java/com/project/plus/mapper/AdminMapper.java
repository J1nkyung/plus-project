package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;


public interface AdminMapper {
	public void deleteAdminInquiry(InquiryVO vo);

	public InquiryVO getAdminInquiry(InquiryVO vo);

	List<InquiryVO> getAdminInquiryList(InquiryVO vo);

	public int getAdminChart(MemberVO mvo);

	public int getAdminVisit(VisitCountVO vcvo);

	public int getAdminDayVisit(VisitCountVO vcvo);

	public int getVisit_1(VisitCountVO vcvo);

	public int getVisit_2(VisitCountVO vcvo);

	public int getVisit_3(VisitCountVO vcvo);

	public int getVisit_4(VisitCountVO vcvo);

	public int getVisit_5(VisitCountVO vcvo);

	public int getVisit_6(VisitCountVO vcvo);

	public int getCateStudy(VisitCountVO vcvo);

	public int getCateExcer(VisitCountVO vcvo);

	public int getCateHabit(VisitCountVO vcvo);

	public int getCateHobby(VisitCountVO vcvo);

	public int getJoinToday(MemberVO mvo);

	public int getJoin_1(MemberVO mvo);

	public int getJoin_2(MemberVO mvo);

	public int getJoin_3(MemberVO mvo);

	public int getJoin_4(MemberVO mvo);

	public int getJoin_5(MemberVO mvo);

	public int getJoin_6(MemberVO mvo);

	public InquiryVO answerInquiryForm(InquiryVO vo);

	public void answerInquiry(InquiryVO vo);

	public List<PaymentVO> adminPayList(PaymentVO pvo);

	public List<ClubVO> adminClubList(ClubVO cvo);

	public void deleteAdminClub(ClubVO cvo);

//	public List<Map<String, Object>> getAdminInquiryList(CriteriaAdmin criAd);
//
//	public int countAdminInquiryList(InquiryVO vo);
//
//	public Integer countAdminInquiryList(String string);
}
