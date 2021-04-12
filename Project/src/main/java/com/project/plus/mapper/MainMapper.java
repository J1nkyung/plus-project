package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.MemberVO;

public interface MainMapper {
	//더하기 만들기
		public void insertClub(ClubVO vo);
		//인기 더하기 리스트
		public List<ClubVO> getListBest(MemberVO mvo);
		//마감임박 더하기 리스트
		public List<ClubVO> getListDeadline(MemberVO mvo);
		//모임 검색
		public List<ClubVO> getListSearch(String keyword);
		

}
