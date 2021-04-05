package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ClubVO;
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
	public void deleteAdminInquiry(InquiryVO vo) {
		mapper.deleteAdminInquiry(vo);
	}
	
	@Override
	public void answerInquiry(InquiryVO vo) {
		mapper.answerInquiry(vo);
	}
	
	@Override
	public InquiryVO getAdminInquiry(InquiryVO vo) {
		return mapper.getAdminInquiry(vo);
	}

	@Override
	public List<InquiryVO> getAdminInquiryList(InquiryVO vo) {
		return mapper.getAdminInquiryList(vo);
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
	public InquiryVO answerInquiryForm(InquiryVO vo) {
		return mapper.answerInquiryForm(vo);
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
	public int getCateStudy(VisitCountVO vcvo) {
		return mapper.getCateStudy(vcvo);
	}

	@Override
	public int getCateExcer(VisitCountVO vcvo) {
		return mapper.getCateExcer(vcvo);
	}

	@Override
	public int getCateHabit(VisitCountVO vcvo) {
		return mapper.getCateHabit(vcvo);
	}

	@Override
	public int getCateHobby(VisitCountVO vcvo) {
		return mapper.getCateHobby(vcvo);
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
	public List<PaymentVO> adminPayList(PaymentVO pvo) {
		return mapper.adminPayList(pvo);
	}
	
	@Override
	public List<ClubVO> adminClubList(ClubVO cvo) {
		return mapper.adminClubList(cvo);
	}

	@Override
	public void deleteAdminClub(ClubVO cvo) {
		mapper.deleteAdminClub(cvo);
		
	}

//	@Override
//	public List<Map<String, Object>> getAdminInquiryList(CriteriaAdmin criAd) {
//		return mapper.getAdminInquiryList(criAd);
//	}
//	
//	public int countAdminInquiryList(InquiryVO vo) {
//		return (Integer)mapper.countAdminInquiryList("admin.countAdminInquiryList");
//	}



}
