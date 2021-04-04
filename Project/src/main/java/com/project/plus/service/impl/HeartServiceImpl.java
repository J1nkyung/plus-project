package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.HeartVO;
import com.project.plus.mapper.HeartMapper;
import com.project.plus.service.HeartService;


@Service("HeartService")
public class HeartServiceImpl implements HeartService {

	@Autowired
	private HeartMapper heartMapper;
	
	@Override
	public List<HeartVO> selectFreeClub(HeartVO vo) {
		return heartMapper.selectFreeClub(vo);
	}
	
	@Override
	public List<HeartVO> selectNoFreeClub(HeartVO vo) {
		return heartMapper.selectNoFreeClub(vo);
	}

	@Override
	public void deleteHeart(HeartVO vo) {
		heartMapper.deleteHeart(vo);
	}

	@Override
	public void insertHeart(HeartVO vo) {
		heartMapper.insertHeart(vo);		
	}

	@Override
	public int selectHeartNum(HeartVO vo) {
		return heartMapper.selectHeartNum(vo);
	}

	public int getHeartCount(int clubNum) {
		return heartMapper.getHeartCount(clubNum);
	}

}
