package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ChatVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.mapper.ClubMapper;
import com.project.plus.service.ClubService;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	ClubMapper mapper;
	
	public void insertClub(ClubVO vo) {
		mapper.insertClub(vo);
	}
	public ClubVO getClub(int clubNum) {
		return mapper.getClub(clubNum);
		
	}
	public List<String> getClubHashtag(int clubNum) {
		return mapper.getClubHashtag(clubNum);
	}
	public ClubVO getMyClubInfo(int clubNum) {
		return mapper.getMyClubInfo(clubNum);
	}
	public int updateClub(ClubVO vo) {
		return mapper.updateClub(vo);
	}
	public void deleteClub(ClubVO vo) {
		mapper.deleteClub(vo);
	}
	
	public int apply(ApplyVO apply) {
		return mapper.apply(apply);
	}
	public Integer getOneApply(ApplyVO apply) {
		return mapper.getOneApply(apply);
	}

	@Override
	public int plusCurnum(int clubNum) {
		return mapper.plusCurnum(clubNum);
	}
	
	//정연 하단 추가 20210326
	// 추가 - 정연 (리뷰에서 쓸 것)
	public ClubVO selectClub(ClubVO vo) {
		return mapper.selectClub(vo);
	}
	
	//정연하단 추가 20210401
	@Override
	public void plusHeartCnt(ClubVO vo) {
		mapper.plusHeartCnt(vo);	
	}
	@Override
	public void minusHeartCnt(ClubVO vo) {
		mapper.minusHeartCnt(vo);		
	}
	
	//정연하단 추가 20210403 클럽리스트 추출 
		// 달력 날짜 출력 
		@Override
		public List<ClubVO> selectClubDate(ClubVO vo) {
			return mapper.selectClubDate(vo);
		}
		
		// 20210329 클럽리스트 추출 
		@Override
		public List<ClubVO> selectCurClubList(ClubVO vo) {
			return mapper.selectCurClubList(vo);
		}
		//20210411 클럽리스트 추출 
		@Override
		public List<ClubVO> selectFinishClubList(ClubVO vo) {
			return mapper.selectFinishClubList(vo);
		}
		
		@Override
		public List<ClubVO> selectFinishMyClubList(ClubVO vo) {
			return mapper.selectFinishMyClubList(vo);
		}
		// 20210411 위 까지
		
		@Override
		public void updateEndDate(ClubVO vo) {
			mapper.updateEndDate(vo);
		}
		
		@Override
		public List<ClubVO> selectAttendClubList(ClubVO vo) {
			return mapper.selectAttendClubList(vo);
		}

		@Override
		public ClubVO clubOut(ClubVO vo) {
			return mapper.clubOut(vo);
		}

		@Override
		public void updateClubCurNum(ClubVO vo) {
			mapper.updateClubCurNum(vo);
			
		}
		@Override
		public void deleteApplyClub(ClubVO vo) {
			mapper.deleteApplyClub(vo);
			
		}

		@Override
		public int clubCnt(ClubVO vo) {
			return mapper.clubCnt(vo);
		}
	
}
