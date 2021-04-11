package com.project.plus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.BoardVO;
import com.project.plus.domain.CriteriaBoardList;
import com.project.plus.domain.PageMakerBoardList;
import com.project.plus.service.ApplyService;
import com.project.plus.service.BoardService;
import com.project.plus.service.ClubService;
import com.project.plus.service.CommentsService;
import com.project.plus.utils.ProfileUtils;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class BoardController {

	@Autowired
	CommentsService commService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ClubService clubService;

	@Autowired
	ApplyService applyService;
	
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
	   public String getCommunity(Model model, @RequestParam("clubNum") int clubNum, @RequestParam(value="memberNum", required=false, defaultValue="0") int memberNum,  HttpSession session) {
		   
			List<ApplyVO> apply =  applyService.applyMember(clubNum);
				List<BoardVO> list = boardService.getBoardList(clubNum);

		    

			
//			//apply 테스트 시 출력방법
//			for(ApplyVO avo : apply) {
//				System.out.println(avo.getMemberNickname());
//				System.out.println(avo.getMemberNickname());
//			}
//			
			
			
			for(BoardVO board : list) {
				int bNum = board.getBoardNum();
				int result = commService.getCommentsCount(bNum);
				board.setCommentsCount(result);
				board.setClubNum(clubNum);
			}
	    
		//콘텐츠 전체보기 
		model.addAttribute("boards", list);
	    //content 더보기를 위해서 개수 카운트
		model.addAttribute("contentCount", boardService.getContentCount(clubNum));
		//aside를 위한 club정보 가져오기
		model.addAttribute("club", clubService.getClub(clubNum));
		//aside 참여중인 멤버 가져오기
		model.addAttribute("apply", apply);
		

	    
		return "community.comm";
	   }
	   
		// json을 이용하여 더보기 리뷰 리스트 가져오기
		// produces : response의 content-type을 utf-8로 인코딩하여 보내기
	   @RequestMapping(value="getMoreContents", produces="application/text;charset=UTF-8", method=RequestMethod.POST)
	   @ResponseBody
	   public String getMoreContents(@RequestBody Map<String, String> param) throws JsonProcessingException{
		   
		   Map<String, Integer> more = new HashMap<String, Integer>();
		   
		   int startIndex = Integer.valueOf(param.get("startIndex").toString());
		   int clubNum = Integer.valueOf(param.get("clubNum").toString());
		   //int memberNum = Integer.valueOf(param.get("memberNum").toString());
		   

		   
		   more.put("startIndex", startIndex);
		   more.put("clubNum", clubNum);
		  // more.put("memberNum", memberNum);
		   
		   List<BoardVO> newContent = boardService.getMoreContents(more);
		   
		// java object -> json
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(newContent);
			return jsonString;

			
			
	   }
	   
	   //내 글 모아보기 
	   @RequestMapping(value="ViewMyList", method=RequestMethod.GET)
	   public String viewMyList(CriteriaBoardList cb, Model model) {
		 
		   //List<BoardVO> view =  boardService.viewMyContents(clubNum, memberNum);
//		   List<BoardVO> view =  boardService.viewMyList(cb, memberNum, clubNum);
		   List<BoardVO> view =  boardService.viewMyList(cb);
//			for(BoardVO vo : view) {
//				System.out.println(vo);
//			}
//			System.out.println("");
		   
			model.addAttribute("list", view);
			
			PageMakerBoardList pmem = new PageMakerBoardList();
		      pmem.setCb(cb);
		      pmem.setTotalCount(boardService.myListCount(cb));
		      model.addAttribute("pmem", pmem);
			
		      System.out.println("club 받는지 확인"+cb.getClubNum());
			
			

		   
		   //return "viewMyList?clubNum="+cb.getClubNum()+"memberNum="+cb.getMemberNum();
		   return "viewMyList.comm";
	   }
	   
	   
	   

	   
	   //내 글 한개 확인하기 - 댓글도 이거 써야됨 
	   @RequestMapping(value="viewMyContent", method=RequestMethod.GET)
	   public String viewMyContents(Model model, int boardNum, HttpSession session) {
		   
		   //List<BoardVO> view =  boardService.viewMyContents(clubNum, memberNum);
		   BoardVO board = boardService.getBoard(boardNum);
		   model.addAttribute("board", board);
			model.addAttribute("club", clubService.getClub(board.getClubNum()));
			model.addAttribute("apply", applyService.applyMember(board.getClubNum()));
			model.addAttribute("commCount", commService.getCommentsCount(boardNum));
		   
		   return "viewMyContent.comm";
	   }
	   
	   
	   
	   
	   @GetMapping("/insertBoardForm")
	   public String insertBoardForm() {
		   return "boardForm.board";
	   }
	   
	   
	   @RequestMapping(value="insertBoard", method=RequestMethod.POST)
	   public String insertBoard(BoardVO board, @RequestParam("boardPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
	      String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
	      board = ProfileUtils.boardPic(board, uploadPath, file);
	      boardService.insertBoard(board);
	      System.out.println("사진 확인" +board.getBoardPic());
	      System.out.println("사진 확인11" + request.getParameter("boardPhoto"));
	      System.out.println("글번호 확인"+board.getBoardNum()+"사진??"+board.getBoardPic());
	      log.info("글 번호 : " + board.getBoardNum() + "사진  등록 ");


	      return "redirect:getCommunity?clubNum="+board.getClubNum();
	   }
	      
	   //게시글 수정하는 화면
	   @RequestMapping(value="updateView", method=RequestMethod.GET)
	   public String updateView(BoardVO board, Model model) {
	      model.addAttribute("update", boardService.getBoard(board.getBoardNum()));
	      System.out.println("updateView get메서드 진입");
	      System.out.println("boardNum "+board.getBoardNum());
	      System.out.println("clubNum "+board.getClubNum());
	      
	     // board.setBoardPic(board.getBoardPic());
	      System.out.println("업데이트get메서드 사진확인"+board.getBoardPic());
	      return "boardUpdateView.board";
	   }
	   //게시글 수정
	   @RequestMapping(value="updateViewPost", method=RequestMethod.POST)
	   public String updateBoard(BoardVO board, @RequestParam("boardPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
	      System.out.println("updateView post 메서드 진입");
	      
	      String uploadPath ;
	      
	      if(request.getParameter("boardPhoto")!=null) {
	      uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
	      board = ProfileUtils.boardPic(board, uploadPath, file);
	      }else {
	    	  uploadPath = board.getOld_file();
	    	  board = ProfileUtils.boardPic(board, uploadPath, file);
	    	  
	      }
	    
	      //String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
	      //board = ProfileUtils.boardPic(board, uploadPath, file);
	      
	      
	      System.out.println(board.getBoardPic());
	      boardService.updateBoard(board);
	      log.info("들어오니?");
	      log.info(board.getBoardContent());
	      return "redirect:getCommunity?clubNum="+board.getClubNum();
	   }
	   
	   //게시글 삭제
	   @RequestMapping("deleteBoard")
	   public String deleteBoard(BoardVO board) throws Exception{
	      System.out.println("delcon 진입");
	      boardService.deleteBoard(board.getBoardNum());
	      System.out.println(board.getBoardNum());
	      System.out.println("클럽넘 확인"+board.getClubNum());
	      return "redirect:getCommunity?clubNum="+board.getClubNum();
	   }
	   
}
