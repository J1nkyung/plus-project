package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;

public interface NormalService {
	public List<ClubVO> getListNormal(ClubVO vo);
	public List<ClubVO> getListNormalBest(ClubVO vo);
}
