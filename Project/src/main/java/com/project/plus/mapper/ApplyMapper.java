package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ApplyVO;

public interface ApplyMapper {

	public void applyFreeClub(ApplyVO vo);
	public ApplyVO checkApplyClub(ApplyVO vo);
	public List<ApplyVO> checkApplyClubByMemberNum(ApplyVO vo);
	public List<ApplyVO> applyPayClubInfo(ApplyVO vo);
}
//정연추가 20210326