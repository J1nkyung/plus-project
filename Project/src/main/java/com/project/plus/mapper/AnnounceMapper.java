package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.AnnounceVO;

public interface AnnounceMapper {
	
	void insertAnnounce(AnnounceVO vo);
	void updateAnnounce(AnnounceVO vo);
	void deleteAnnounce(AnnounceVO vo);
	AnnounceVO getAnnounce(AnnounceVO vo);
	List<AnnounceVO> getAnnounceList(AnnounceVO vo);
	
}
