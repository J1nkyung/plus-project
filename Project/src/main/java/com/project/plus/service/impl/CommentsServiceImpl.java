package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.CommentsVO;
import com.project.plus.mapper.CommentsMapper;
import com.project.plus.service.CommentsService;

@Service
public class CommentsServiceImpl implements CommentsService {

	@Autowired
	CommentsMapper mapper;
	
	@Override
	public int insertComment(CommentsVO comments) {
		return mapper.insertComment(comments);
		
	}

	@Override
	public int updateComment(CommentsVO comments) {
		return mapper.updateComment(comments);
	}
	
	@Override
	public int deleteComment(CommentsVO comments) {
		return mapper.deleteComment(comments);
	}

	@Override
	public List<CommentsVO> getComments(CommentsVO comments) {
		return mapper.getComments(comments);
	}

	@Override
	public List<CommentsVO> getMoreComments(int boardNum) {
		return mapper.getMoreComments(boardNum);
	}

	@Override
	public int getCommentsCount(int bNum) {
		return mapper.getCommentsCount(bNum);
	}

	@Override
	public List<CommentsVO> getReComments(CommentsVO comments) {
		return mapper.getReComments(comments);
	}

	@Override
	public int insertReComments(CommentsVO comments) {
		return mapper.insertReComments(comments);
	}



	
	
}
