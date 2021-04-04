package com.project.plus.service;

import java.util.List;
import com.project.plus.domain.ClubVO;

public interface MainService {
	//더하기 만들기
	public void insertClub(ClubVO vo);
	//인기 더하기 리스트
	public List<ClubVO> getListBest(ClubVO vo);
	//마감임박 더하기 리스트
	public List<ClubVO> getListDeadline(ClubVO vo);
	//모임 검색
	public List<ClubVO> getListSearch(String keyword);
	
}
