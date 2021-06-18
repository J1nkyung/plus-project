package com.project.plus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.CommentsVO;
import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.PageMakerMem;
import com.project.plus.service.CommentsService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommentsController {

	@Autowired
	CommentsService commService;

//	@RequestMapping("/getComments")
//	@ResponseBody
//	public List<CommentsVO> getComments(CommentsVO comments) {
//		List<CommentsVO> list = commService.getComments(comments);
//		return list;
//	}
//	
	@RequestMapping("/getComments")
	@ResponseBody
	public Map<String, Object> getComments(CommentsVO comments, @RequestBody Map<String, String> param)
			throws Exception {
		Map<String, Integer> condition = new HashMap<String, Integer>();
		Map<String, Object> result = new HashMap<String, Object>();
		
		int boardNum = Integer.valueOf(param.get("boardNum").toString());
		int page = Integer.valueOf(param.get("page").toString());
		if (page == 0) page = 1;
		
		// 10개씩 보여주기 위해 설정 
		int limit = 10;
		// 전체 댓글 개수 
		int listCount = commService.getCommentsCount(boardNum);
		
		log.info("글번호 " + boardNum + ", 총 댓글 수 : " + listCount +  ", 현재 페이지 " + page);

		// sql의 limit 조건으로 보낼 개수  
		int startIndex = ((page - 1) * limit);
		
		// 총 페이지 넘버 
		int maxpage = (listCount + limit - 1) / limit;
		if(maxpage == 0) maxpage=1;

		// 끝 페이지 번호 
		int endpage = (int)(Math.ceil(page / (double)limit) * limit);
		// 시작 페이지 번호 
		int startpage = (endpage - limit) + 1;
		
		// ex) endpage가 20인데 maxpage는 14일 때를 대비함 
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		// 이전과 다음을 표시하기 위함 
		boolean prev = startpage == 1 ? false : true;
		// ex) endpage=10이고 listcount가 140일 때 true값이 나온다.
		boolean next = endpage * limit >= listCount ? false : true;
		
		log.info("시작페이지 " + startpage + " 끝페이지" + endpage);
		
		condition.put("boardNum", boardNum);
		condition.put("startIndex", startIndex);
		List<CommentsVO> commList = commService.getComments(condition);
		
		result.put("commList", commList);
		result.put("page", page);
		result.put("startpage", startpage);
		result.put("endpage", endpage);
		result.put("prev", prev);
		result.put("next", next);

		return result;

	}

	@RequestMapping("/insertComment")
	@ResponseBody
	public CommentsVO insertComment(CommentsVO comments) {
		// 댓글을 등록하면 vo를 다시 화면에 뿌려줘야 함
		commService.insertComment(comments);
		log.info("게시글 번호 : " + comments.getBoardNum());

		// 보드 넘버의 작성자 찾기
		int bNum = comments.getBoardNum();
		if (bNum != 0) {
			CommentsVO vo = commService.getBoardWriter(bNum);
			comments.setBoardWriter(vo.getMemberNum());
			log.info("작성자 번호 : " + vo.getMemberNum());
		}
		return comments;
	}

	@RequestMapping("/updateComment")
	@ResponseBody
	public int updateComment(CommentsVO comments) {
		int result = commService.updateComment(comments);
		return result;
	}

	@RequestMapping("/deleteComment")
	@ResponseBody
	public int deleteComment(CommentsVO comments) {
		int result = commService.deleteComment(comments);
		return result;
	}

	// 댓글 개수 가져오기
	public int getCommentsCount(int bNum) {
		return commService.getCommentsCount(bNum);
	}

	// 대댓글 목록 가져오기
	@RequestMapping("/getReComments")
	@ResponseBody
	public List<CommentsVO> getReComments(CommentsVO comments) {
		return commService.getReComments(comments);
	}

	@RequestMapping("/insertReComments")
	@ResponseBody
	public CommentsVO insertReComments(CommentsVO comments) {
		commService.insertReComments(comments);
		log.info("대댓글 번호 : " + comments.getCommentsNum());
		return comments;
	}

}
