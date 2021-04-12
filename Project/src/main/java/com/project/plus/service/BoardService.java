package com.project.plus.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.plus.domain.BoardVO;

public interface BoardService {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int boardNum);
	public List<BoardVO> getMoreContents(Map<String, Integer> map);
	public int getContentCount(int clubNum);	
	public List<BoardVO> viewMyList(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd) throws Exception;
	public int viewMyListCount(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum) throws Exception;

}