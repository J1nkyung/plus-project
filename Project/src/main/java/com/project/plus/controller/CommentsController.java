package com.project.plus.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.CommentsVO;
import com.project.plus.service.CommentsService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommentsController {
	
	
	@Autowired
	CommentsService commService;
	
	@RequestMapping("/getComments")
	@ResponseBody
	public List<CommentsVO> getComments(CommentsVO comments) {
		List<CommentsVO> list = commService.getComments(comments);
		return list;
	}
	
	@RequestMapping("/insertComment")
	@ResponseBody
	public CommentsVO insertComment(CommentsVO comments) {
		// 댓글을 등록하면 vo를 다시 화면에 뿌려줘야 함 
		commService.insertComment(comments);
		log.info(comments.getCommentsNum());
		return comments;
	}
	
	@RequestMapping("/updateComment")
	@ResponseBody
	public int updateComment(CommentsVO comments) {
		int result = commService.updateComment(comments);
		return result;
	}
	
	@RequestMapping("/deleteComment")
	@ResponseBody
	public int deleteComment(CommentsVO comments) {
		int result = commService.deleteComment(comments);
		return result;
	}

	// 댓글 개수 가져오기 
	public int getCommentsCount(int bNum) {
		return commService.getCommentsCount(bNum);
	}
	
	
	// 대댓글 목록 가져오기 
	@RequestMapping("/getReComments")
	@ResponseBody
	public List<CommentsVO> getReComments(CommentsVO comments) {
		return commService.getReComments(comments);
	}
	
	@RequestMapping("/insertReComments")
	@ResponseBody
	public CommentsVO insertReComments(CommentsVO comments) {
		commService.insertReComments(comments);
		log.info("대댓글 번호 : " + comments.getCommentsNum());
		return comments;
	}
	

}
