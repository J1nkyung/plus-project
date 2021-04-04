package com.project.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.plus.domain.BoardVO;
import com.project.plus.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardController {

	@Autowired
	BoardService boardService;
	
	//게시판 메인화면 접속 
	@RequestMapping("getCommunity")
	public String getCommunity(Model model, HttpSession session) {
		session.getAttribute("user");
		model.addAttribute("boards", boardService.getBoardList());

		//model.addAttribute("boards", boardService.getBoard(3));
		//model.addAttribute("comments", commService.getBoard(3));
		
		
		return "community.comm";
		
// 	aside 뿌려주기
//		model.addAttribute(멤버 닉네임 : apply, member 테이블 쪼인 결과 );
//		model.addAttribute(club정보);
		

	}
	

	@GetMapping("/insertBoardForm")
	public String insertBoardForm() {
		return "boardForm.board";
	}
	
	
	@RequestMapping(value="insertBoard", method=RequestMethod.POST)
	public String insertBoard(BoardVO board) {
		boardService.insertBoard(board);
		return "redirect:getCommunity";
	}
	
	//글 한개만 보기 - 수정할 때 사용 - 컨트롤러는 필요없어  service 같은 다른곳 메서드들은 필요
//	@RequestMapping("getBoard")
//	public String getBoard(BoardVO board, Model model) throws Exception {
//		System.out.println("getboard 진입?");
//		model.addAttribute("board", boardService.getBoard(board.getBoardNum()));
//		
//		return "boardUpdateView";
//	}
	
	//커뮤니티 글들만 보기
//	@RequestMapping(value="getBoardList", method=RequestMethod.GET)
//	public String getBoardList(Model model) throws Exception{
//		model.addAttribute("boards", boardService.getBoardList());
//		return "getCommunity";
//	}
	
	
	//게시글 수정하는 화면
	@RequestMapping(value="updateView", method=RequestMethod.GET)
	public String updateView(BoardVO board, Model model) {
		model.addAttribute("update", boardService.getBoard(board.getBoardNum()));
		System.out.println("updateView get메서드 진입");
		System.out.println(board.getBoardNum());
		return "boardUpdateView.board";
	}

	//게시글 수정
	@RequestMapping(value="updateView", method=RequestMethod.POST)
	public String updateBoard(BoardVO board) throws Exception {
		System.out.println("updateView post 메서드 진입");
		boardService.updateBoard(board);
		return "redirect:getCommunity";
	}
	
	//게시글 삭제
	@RequestMapping("deleteBoard")
	public String deleteBoard(BoardVO board) throws Exception{
		System.out.println("delcon 진입");
		boardService.deleteBoard(board.getBoardNum());
		System.out.println(board.getBoardNum());
		return "redirect:getCommunity";
	}
	
}
