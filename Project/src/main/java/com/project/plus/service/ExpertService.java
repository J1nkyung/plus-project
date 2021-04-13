package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.MemberVO;

public interface ExpertService {

	public List<ClubVO> getListExpert(MemberVO mvo);
	public List<ClubVO> getListExpertBest(MemberVO mvo);
}
