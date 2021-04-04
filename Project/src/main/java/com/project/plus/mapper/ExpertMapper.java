package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;

public interface ExpertMapper {
	public List<ClubVO> getListExpert(ClubVO vo);
	public List<ClubVO> getListExpertBest(ClubVO vo);

}
