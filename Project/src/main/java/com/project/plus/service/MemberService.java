package com.project.plus.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.SearchCriteriaMem;

public interface MemberService {

	//회원가입
	void joinMember(MemberVO vo);

	public MemberVO login(MemberVO vo);
	public Integer kakaologin(MemberVO vo);

	// 휴대폰번호 중복 검사
	public int memberPChk(String memberPhone);
	// 닉네임 중복 검사
	public int memberNChk(String memberNickname);
	
	
	public void logout(HttpSession session);
		
	void updateMember(MemberVO vo);
	void deleteMember(int memberNum);
	
	public MemberVO selectMember(MemberVO vo);
	public MemberVO viewMember(int memberNum);

	public List<MemberVO> memberList(SearchCriteriaMem scmem);
	public int listCount(SearchCriteriaMem scmem);

	   void updateMemberPoint (MemberVO vo);
	   int selectMemberPoint (MemberVO vo);
	   int selectMemberPointByNickname(MemberVO vo);
	//   int selectMemberPoint(PaymentVO vo);
	   void deductMemberPoint(MemberVO vo);
	   void updateClubLeaderPoint(MemberVO vo);


}
