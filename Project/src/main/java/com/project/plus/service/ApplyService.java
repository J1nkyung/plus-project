package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ApplyVO;

public interface ApplyService {
	
//	List<HeartVO> selectFreeClub(HeartVO vo); 
//	List<HeartVO> selectNoFreeClub(HeartVO vo); 
	void applyFreeClub(ApplyVO vo);
	ApplyVO checkApplyClub(ApplyVO vo);
	List<ApplyVO> checkApplyClubByMemberNum(ApplyVO vo);
	List<ApplyVO> applyPayClubInfo(ApplyVO vo);
	
}

//정연추가 20210326