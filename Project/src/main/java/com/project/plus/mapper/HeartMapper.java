package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.HeartVO;

public interface HeartMapper {
	
	public List<HeartVO> selectFreeClub(HeartVO vo);
	public List<HeartVO> selectNoFreeClub(HeartVO vo);
	public void deleteHeart(HeartVO vo);
	public void insertHeart(HeartVO vo);
	public int selectHeartNum(HeartVO vo);
	public int getHeartCount(int clubNum);
//	public void applyFreeClub(ApplyVO vo);
//	public ApplyVO checkApplyClub(ApplyVO vo);
}