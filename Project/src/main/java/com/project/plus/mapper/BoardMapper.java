package com.project.plus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.plus.domain.BoardVO;

public interface BoardMapper {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum); //clubNum int 받아야됨
	public List<BoardVO> getMoreContents(Map<String,Integer> map);
	public int getContentCount(int BoardNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int BoardNum);
	public List<BoardVO> viewMyList(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd) throws Exception;
	public int viewMyListCount(@Param("clubNum") int clubNum, @Param("memberNum") int memberNum) throws Exception;

	
}
