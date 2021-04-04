package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ChatVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.domain.ReviewVO;

public interface ClubService {
	public void insertClub(ClubVO vo);
	public ClubVO getClub(int clubNum);
	public List<String> getClubHashtag();
	public ClubVO getMyClubInfo(ClubVO vo);
	public int updateClub(ClubVO vo);
	public void deleteClub(ClubVO vo);
	public int apply(ApplyVO apply);
	public Integer getOneApply(ApplyVO apply);
	public int plusCurnum(int clubNum);
	
	// 정연하단 추가 20210326
	public ClubVO selectClub(ClubVO vo);
}
