package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;

public interface NormalMapper {
	public List<ClubVO> getListNormal(ClubVO vo);
	public List<ClubVO> getListNormalBest(ClubVO vo);

}
