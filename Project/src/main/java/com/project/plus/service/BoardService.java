package com.project.plus.service;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.BoardVO;
import com.project.plus.domain.CriteriaBoardList00;
import com.project.plus.domain.CriteriaMem;

public interface BoardService {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int boardNum);
	public List<BoardVO> getMoreContents(Map<String, Integer> map);
	public int getContentCount(int clubNum);	
//	public List<BoardVO> viewMyList(CriteriaBoardList cb, int memberNum, int club);
	public int myListCount(int boardNum);
	public List<BoardVO> viewMyList(int clubNum, int memberNum, int rowStart, int rowEnd);

}