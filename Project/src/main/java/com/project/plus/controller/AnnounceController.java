package com.project.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.service.AnnounceService;

@Controller
//@SessionAttributes("announce")
public class AnnounceController {
	
	@Autowired
	private AnnounceService as;
	
	// 공지사항 작성 폼
		@RequestMapping("/announceForm")
		public String announceForm(AnnounceVO vo) {
			return "announceForm.ann";
		}
		
		// 공지사항 작성 메서드
		@RequestMapping(value="/insertAnnounce", method = RequestMethod.POST)
		public String insertAnnounce(AnnounceVO vo) throws Exception {
			as.insertAnnounce(vo);	
			return "redirect:announce";
		}
		
		// 공지사항 수정 폼
		@RequestMapping("/updateForm")
		public String updateForm(AnnounceVO vo, Model model) {
			model.addAttribute("updateAnnounce", as.updateForm(vo));
			return "updateForm.ann";
		}
		
		// 공지사항 수정 메서드
		@RequestMapping("/updateAnnounce")
		public String updateAnnounce(@ModelAttribute("announce") AnnounceVO vo) {
			System.out.println(vo);
			as.updateAnnounce(vo);
			return "redirect:announce";
		}
		
		// 공지사항 삭제 메서드
		@RequestMapping("/deleteAnnounce")
		public String deleteAnnounce(AnnounceVO vo) {
			as.deleteAnnounce(vo);
			return "redirect:announce";
		}
		
		// 공지사항 개별 글 조회 메서드
		@RequestMapping("/getAnnounce")
		public String getAnnounce(AnnounceVO vo, Model model) {
			model.addAttribute("announce", as.getAnnounce(vo));
			return "getAnnounce";
		}
		
		// 공지사항 전체 게시판 조회 메서드 
		@RequestMapping("announce")
		public String getAnnounceList(AnnounceVO vo, Model model, HttpSession session) {
			session.getAttribute("user");
			model.addAttribute("announceList", as.getAnnounceList(vo));
			return "announce.ann";
		}
}
