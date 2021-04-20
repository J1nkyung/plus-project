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
import com.project.plus.domain.CommentsVO;
import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.PageMakerMem;
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
      @RequestMapping("getCommunity")
      public String getCommunity(Model model, @RequestParam("clubNum") int clubNum, @RequestParam(value="memberNum", required=false, defaultValue="0") int memberNum,  HttpSession session) {
         
         List<ApplyVO> apply =  applyService.applyMember(clubNum);
            List<BoardVO> list = boardService.getBoardList(clubNum);

         
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
      //정연추가 20210410 단일 clubNum 받아오기 -추가o 지운것 없음 
      model.addAttribute("clubNum" , clubNum);
       
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
      public String viewMyList(Model model, CommentsVO cvo , BoardVO board, CriteriaMem cri, @RequestParam("clubNum") int clubNum, @RequestParam("memberNum") int memberNum, HttpSession session) throws Exception {
       
         // 정연  
         model.addAttribute("clubNum", clubNum);
         model.addAttribute("memberNum", memberNum);
         // 정연 끝
         
         int rowStart = cri.getRowStart(); //1
         int rowEnd = cri.getRowEnd();//10
         //List<BoardVO> view =  boardService.viewMyContents(clubNum, memberNum);
         List<BoardVO> view =  boardService.viewMyList(clubNum, memberNum ,rowStart , rowEnd);
         model.addAttribute("list", view);
         int totalListCount = boardService.viewMyListCount(clubNum, memberNum);
         PageMakerMem pmem = new PageMakerMem();
         pmem.setCriMem(cri);
         pmem.setTotalCount(totalListCount);
         model.addAttribute("pmem", pmem);
         
         model.addAttribute("club", clubService.getClub(clubNum)); // 사이드바 - 클럽활동기간
         List<ApplyVO> apply =  applyService.applyMember(clubNum); // 사이드바  - 참여중인 멤버
         model.addAttribute("apply", apply);
         
         
         /* 20210410 정연하단 추가*/
//         int rowStart = cri.getRowStart(); //1
//         int rowEnd = cri.getRowEnd();//10
         List<CommentsVO> cmts = commService.selectMyCommentsList(clubNum, memberNum, rowStart, rowEnd); // 댓글 꺼내오기 
         model.addAttribute("cmts" , cmts); // 값 모델로 보내기 
         System.out.println(" 20210410 commentsList : " + cmts);

         int totalCount = commService.selectMyCommentsListCount(clubNum, memberNum);  
         PageMakerMem pgmm = new PageMakerMem();
         pgmm.setCriMem(cri);
         pgmm.setTotalCount(totalCount);
         model.addAttribute("PageMakerComments" , pgmm);
         
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
      public String insertBoardForm(BoardVO board, Model model) {
         /*정연추가 20210410 매개변수 clubNum 그리고 model 받아오기 추가, 하단 추가*/
        // System.out.println("****인서트 컨트롤러 clubNum: " + clubNum);
         System.out.println(board.getClubNum()+"확인");
         model.addAttribute("clubNum", board.getClubNum());
         
         /*여기 위까지 추가 20210410 지운거 없음 */
         return "boardForm.board"; 
      }
      
      @RequestMapping(value="insertBoards", method=RequestMethod.POST)
      public String insertBoard(BoardVO board, @RequestParam("boardPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
         System.out.println("post진입???");
         String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
//         board.setClubNum(clubNum);
         int clubNum = board.getClubNum();
         System.out.println("클럽넘확인"+board.getClubNum());
         board = ProfileUtils.boardPic(board, uploadPath, file);
         boardService.insertBoard(board);
         log.info("글 번호 : " + board.getBoardNum() + "사진  등록 ");

         return "redirect:getCommunity?clubNum="+clubNum;
      }
         
      
      //게시글 수정하는 화면
      @RequestMapping(value="updateView", method=RequestMethod.GET)
      public String updateView(BoardVO board, Model model) {
         model.addAttribute("update", boardService.getBoard(board.getBoardNum()));
         System.out.println("updateView get메서드 진입");
         System.out.println(board.getBoardNum());
         System.out.println(board.getClubNum());
         return "boardUpdateView.board";
      }
      
      
      
      
    //게시글 수정 기존 시도
      @RequestMapping(value="updateViewPost", method=RequestMethod.POST)
      public String updateBoard(BoardVO board, @RequestParam("boardPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
         System.out.println("updateView post 메서드 진입");
         
         
         if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
            System.out.println("확인1번");
       
         
            System.out.println(file.getOriginalFilename()+"새로 업로드한 파일"); //새파일명 출력됨
            

            
            String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
            board = ProfileUtils.boardPic(board, uploadPath, file);
            
         log.info("확인중~~"+board.getBoardPic());
         }else {
            System.out.println("확인2번"); //사진업로드 따로 안했을 때 
            board.setBoardPic(request.getParameter("boardPhoto"));
         }
         

         
         System.out.println("최종 업뎃될 파일 "+board.getBoardPic());
         System.out.println("최종 업뎃될 글내용"+board.getBoardContent());
         boardService.updateBoard(board);
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