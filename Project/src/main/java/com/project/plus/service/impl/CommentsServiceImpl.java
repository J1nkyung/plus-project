package com.project.plus.service.impl;

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
	public CommentsVO insertComment(CommentsVO comments) {
		return mapper.insertComment(comments);
	}
	
}
