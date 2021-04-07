package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;

public interface ExpertService {

	public List<ClubVO> getListExpert(ClubVO vo);
	public List<ClubVO> getListExpertBest(ClubVO vo);
}
