package com.project.plus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.plus.domain.BoardVO;
import com.project.plus.service.BoardService;
import com.project.plus.service.CommentsService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class BoardController {

	@Autowired
	CommentsService commService;
	
	@Autowired
	BoardService boardService;
	
	//게시판 메인화면 접속 
	// getCommunity?(클럽번호)로 url주소가 들어오면 
	// @RequestParam("clubNum") int clubNum 나중에 매개변수로 넣기 
	
	//@RequestMapping("/getCommunity")
//	public String getCommunity(Model model) {	
//// 깃 테스트 
//		List<BoardVO> list = boardService.getBoards(3);
//		
//		for(BoardVO board : list) {
//			int result = commService.getCommentsCount(board.getBoardNum());
//			board.setCommentsCount(result);
//		}
//		
//		log.info("들어왔니?"+list.get(1).toString());
//		model.addAttribute("boards", list);
//		
//		return "community.comm";
//		
//	}
	   //게시판 메인화면 접속 
	   @RequestMapping("getCommunity")
	   public String getCommunity(Model model,@RequestParam("clubNum") int clubNum) {
		   
			List<BoardVO> list = boardService.getBoardList(clubNum);
			
			for(BoardVO board : list) {
				int bNum = board.getBoardNum();
				int result = commService.getCommentsCount(bNum);
				board.setCommentsCount(result);
				board.setClubNum(clubNum);
			}
	     
	      model.addAttribute("boards", list);

	      return "community.comm";
	            

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
