package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.CommentsVO;

public interface CommentsService {
	public int insertComment(CommentsVO comments);
	public int deleteComment(CommentsVO comments);
	public int updateComment(CommentsVO comments);
	public List<CommentsVO> getComments(CommentsVO comments);
	public List<CommentsVO> getMoreComments(int boardNum);
	public int getCommentsCount(int bNum);
}
