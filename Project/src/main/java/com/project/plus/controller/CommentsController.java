package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.CommentsVO;
import com.project.plus.service.CommentsService;

public class CommentsController {
	
	
	@Autowired
	CommentsService commService;
	
	@RequestMapping("/inseretComment")
	@ResponseBody
	public CommentsVO insertComment(CommentsVO comments) {
		// 댓글을 등록하면 vo를 다시 화면에 뿌려줘야 함 
		commService.insertComment(comments);
		return null;
	}
}
