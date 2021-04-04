package com.project.plus.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ReviewVO;
import com.project.plus.mapper.ReviewMapper;
import com.project.plus.service.ReviewService;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper; // boardDAOMybatis
	
//	@Autowired
//	HttpSession session;

	@Override
	public List<ReviewVO> selectNotReview(ReviewVO vo) {
		return reviewMapper.selectNotReview(vo);
	}

	@Override
	public List<ReviewVO> selectOkayReview(ReviewVO vo) {
		return reviewMapper.selectOkayReview(vo);
		
	}

	@Override
	public void insertReview(ReviewVO vo) {
		
	}
	
	
	@Override
	public String reviewList() {
		return "넘어간다!vo";
	}

	@Override
	public List<ReviewVO> getReviews(int clubNum) {
		return reviewMapper.getReviews(clubNum);
		
	}
	@Override
	public List<ReviewVO> getMoreReviews(Map<String,Integer> map) {
		return reviewMapper.getMoreReviews(map);
		
	}

	@Override
	public int getReviewCount(int clubNum) {
		return reviewMapper.getReviewCount(clubNum);
		
	}
	
	//정연하단 추가 20210326
	@Override
	public ReviewVO readReview(ReviewVO vo) {
		return reviewMapper.readReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewMapper.updateReview(vo);		
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewMapper.deleteReview(vo);			
	}

	
	

	

}
