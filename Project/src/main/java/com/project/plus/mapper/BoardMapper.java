<<<<<<< HEAD
<<<<<<< HEAD
package com.project.plus.mapper;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.BoardVO;
import com.project.plus.domain.ReviewVO;

public interface BoardMapper {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum); //clubNum int 받아야됨
	public List<ReviewVO> getMoreContents(Map<String,Integer> map);
	public void getContentCount(int BoardNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int BoardNum);

	
	
}
=======
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
package com.project.plus.mapper;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.BoardVO;

public interface BoardMapper {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum); //clubNum int 받아야됨
	public List<BoardVO> getMoreContents(Map<String,Integer> map);
	public int getContentCount(int BoardNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int BoardNum);

	
	
}
<<<<<<< HEAD
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
