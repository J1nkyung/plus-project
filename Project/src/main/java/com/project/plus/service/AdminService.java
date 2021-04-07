<<<<<<< HEAD
package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;

public interface AdminService {
	
	InquiryVO answerInquiryForm(InquiryVO vo);
	void answerInquiry(InquiryVO vo);
	void deleteAdminInquiry(InquiryVO vo);

	InquiryVO getAdminInquiry(InquiryVO vo);
	public List<InquiryVO> getAdminInquiryList(CriteriaAdmin cri) throws Exception;
	public int adminInquiryListCount(CriteriaAdmin cri) throws Exception;
	
	int getAdminChart(MemberVO mvo);
	
	int getAdminVisit(VisitCountVO vcvo);
	
	int getAdminDayVisit(VisitCountVO vcvo);
	
	int getVisit_1(VisitCountVO vcvo);
	int getVisit_2(VisitCountVO vcvo);
	int getVisit_3(VisitCountVO vcvo);
	int getVisit_4(VisitCountVO vcvo);
	int getVisit_5(VisitCountVO vcvo);
	int getVisit_6(VisitCountVO vcvo);
	
	int getCateStudy(VisitCountVO vcvo);
	int getCateExcer(VisitCountVO vcvo);
	int getCateHabit(VisitCountVO vcvo);
	int getCateHobby(VisitCountVO vcvo);
	
	int getJoinToday(MemberVO mvo);
	int getJoin_1(MemberVO mvo);
	int getJoin_2(MemberVO mvo);
	int getJoin_3(MemberVO mvo);
	int getJoin_4(MemberVO mvo);
	int getJoin_5(MemberVO mvo);
	int getJoin_6(MemberVO mvo);

	public List<PaymentVO> adminPayList(CriteriaAdmin cri) throws Exception;
	public int adminPayListCount(CriteriaAdmin cri) throws Exception;
	
	void deleteAdminClub(ClubVO cvo);

	public List<ClubVO> adminClubList(CriteriaAdmin cri) throws Exception;
	public int adminClubListCount(CriteriaAdmin cri) throws Exception;
	
}
=======
package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.VisitCountVO;

public interface AdminService {
	
	InquiryVO answerInquiryForm(InquiryVO vo);
	void answerInquiry(InquiryVO vo);
	void deleteAdminInquiry(InquiryVO vo);

	InquiryVO getAdminInquiry(InquiryVO vo);
	public List<InquiryVO> getAdminInquiryList(CriteriaAdmin cri) throws Exception;
	public int adminInquiryListCount(CriteriaAdmin cri) throws Exception;
	
	int getAdminChart(MemberVO mvo);
	
	int getAdminVisit(VisitCountVO vcvo);
	
	int getAdminDayVisit(VisitCountVO vcvo);
	
	int getVisit_1(VisitCountVO vcvo);
	int getVisit_2(VisitCountVO vcvo);
	int getVisit_3(VisitCountVO vcvo);
	int getVisit_4(VisitCountVO vcvo);
	int getVisit_5(VisitCountVO vcvo);
	int getVisit_6(VisitCountVO vcvo);
	
	int getCateStudy(VisitCountVO vcvo);
	int getCateExcer(VisitCountVO vcvo);
	int getCateHabit(VisitCountVO vcvo);
	int getCateHobby(VisitCountVO vcvo);
	
	int getJoinToday(MemberVO mvo);
	int getJoin_1(MemberVO mvo);
	int getJoin_2(MemberVO mvo);
	int getJoin_3(MemberVO mvo);
	int getJoin_4(MemberVO mvo);
	int getJoin_5(MemberVO mvo);
	int getJoin_6(MemberVO mvo);

	public List<PaymentVO> adminPayList(CriteriaAdmin cri) throws Exception;
	public int adminPayListCount(CriteriaAdmin cri) throws Exception;
	
	void deleteAdminClub(ClubVO cvo);

	public List<ClubVO> adminClubList(CriteriaAdmin cri) throws Exception;
	public int adminClubListCount(CriteriaAdmin cri) throws Exception;
	
}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
