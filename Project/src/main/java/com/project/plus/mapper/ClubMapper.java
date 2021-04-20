package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ChatVO;
import com.project.plus.domain.ClubVO;

public interface ClubMapper {
	public void insertClub(ClubVO vo);
	public ClubVO getClub(int clubNum);
	public List<String> getClubHashtag(int clubNum);
	public ClubVO getMyClubInfo(int clubNum);
	public int updateClub(ClubVO vo);
	public void deleteClub(ClubVO vo);
	public int apply(ApplyVO apply);
	public Integer getOneApply(ApplyVO apply);
	public int plusCurnum(int clubNum);
	
	//정연하단 추가 20210326
	public ClubVO selectClub(ClubVO vo);
	//정연하단 추가 20210401
	public void plusHeartCnt(ClubVO vo);
	public void minusHeartCnt(ClubVO vo);
	//정연하단 추가 20210403 현재모임현황페이지
	public List<ClubVO> selectClubDate(ClubVO vo);//달력 날짜 출력
	public List<ClubVO> selectCurClubList(ClubVO vo);// 클럽리스트 추출 
	public void updateEndDate(ClubVO vo);
	public List<ClubVO> selectAttendClubList(ClubVO vo);
	public ClubVO clubOut(ClubVO vo);
	public void deleteApplyClub(ClubVO vo);
	public void updateClubCurNum(ClubVO vo);
	public int clubCnt(int memberNum);
	//정연추가20210411 finishclub
	public List<ClubVO> selectFinishClubList(ClubVO vo);
	public List<ClubVO> selectFinishMyClubList(ClubVO vo);
}
