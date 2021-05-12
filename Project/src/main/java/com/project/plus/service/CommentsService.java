package com.project.plus.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.plus.domain.CommentsVO;
import com.project.plus.domain.CriteriaMem;

public interface CommentsService {
	public int insertComment(CommentsVO comments);
	public int deleteComment(CommentsVO comments);
	public int updateComment(CommentsVO comments);
	public List<CommentsVO> getComments(Map<String,Integer> condition);
	public List<CommentsVO> getMoreComments(int boardNum);
	public int getCommentsCount(int bNum);
	public List<CommentsVO> getReComments(CommentsVO comments);
	public int insertReComments(CommentsVO comments);
	public CommentsVO getBoardWriter(int bNum);
	
	
	/*정연 추가 내가쓴 댓글 보기 20210410*/
	public List<CommentsVO> selectMyCommentsList(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd) throws Exception;
	public int selectMyCommentsListCount(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum) throws Exception;
	
}
