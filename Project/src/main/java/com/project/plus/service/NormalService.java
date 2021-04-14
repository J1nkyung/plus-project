package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.MemberVO;

public interface NormalService {
	public List<ClubVO> getListNormal(MemberVO mvo);
	public List<ClubVO> getListNormalBest(MemberVO mvo);
}
