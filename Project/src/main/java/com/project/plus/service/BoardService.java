package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.BoardVO;

public interface BoardService {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int boardNum);
	
}
