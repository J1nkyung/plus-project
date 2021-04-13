package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.MemberVO;


public interface NormalMapper {
	public List<ClubVO> getListNormal(MemberVO mvo);
	public List<ClubVO> getListNormalBest(MemberVO mvo);

}
