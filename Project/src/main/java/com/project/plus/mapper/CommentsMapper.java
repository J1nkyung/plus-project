package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.CommentsVO;

public interface CommentsMapper {
	public int insertComment(CommentsVO comments);
	public int deleteComment(CommentsVO comments);
	public int updateComment(CommentsVO comments);
	public List<CommentsVO> getComments(CommentsVO comments);
	public List<CommentsVO> getMoreComments(int boardNum);
	public int getCommentsCount(int bNum);
	public List<CommentsVO> getReComments(CommentsVO comments);
	public int insertReComments(CommentsVO comments);
	public int getBoardWriter(int bNum);
}
