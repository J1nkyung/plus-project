<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
package com.project.plus.service;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.BoardVO;

public interface BoardService {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int boardNum);
	public List<BoardVO> getMoreContents(Map<String, Integer> map);
	public int getContentCount(int clubNum);	

}
<<<<<<< HEAD
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
