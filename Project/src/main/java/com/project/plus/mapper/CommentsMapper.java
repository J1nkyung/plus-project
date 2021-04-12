package com.project.plus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.plus.domain.CommentsVO;
import com.project.plus.domain.CriteriaMem;

public interface CommentsMapper {
	public int insertComment(CommentsVO comments);
	public int deleteComment(CommentsVO comments);
	public int updateComment(CommentsVO comments);
	public List<CommentsVO> getComments(CommentsVO comments);
	public List<CommentsVO> getMoreComments(int boardNum);
	public int getCommentsCount(int bNum);
	public List<CommentsVO> getReComments(CommentsVO comments);
	public int insertReComments(CommentsVO comments);
	public CommentsVO getBoardWriter(int bNum);
	/*정연 추가 내가쓴 댓글 보기 20210410*/
	public List<CommentsVO> selectMyCommentsList(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd) throws Exception;
	public int selectMyCommentsListCount(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum) throws Exception;
}
