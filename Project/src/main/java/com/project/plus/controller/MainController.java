package com.project.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.MainService;
import com.project.plus.service.VisitCountService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@AllArgsConstructor
public class MainController {

	@Autowired
	private MainService service;
	
	@Autowired
	private VisitCountService vcs;

	@RequestMapping("/main")
	public String mainList(Model model, ClubVO cvo, MemberVO mvo, HttpSession session) {
		log.info("main");
		// main페이지 방문한 방문자 수 카운팅하는 메서드 호출 0409 현정 (절대 지우지 마세요!)
		vcs.setTotalCount();
	  
//세션에 값 담기
		session.setAttribute("memberLatitude", mvo.getMemberLatitude());
		session.setAttribute("memberLongitude", mvo.getMemberLongitude());
		System.out.println("memberLatitude" + mvo.getMemberLatitude() + "memberLongitude" + mvo.getMemberLongitude());
		
		// service.getListBest(인기더하기)를 main이라는 이름을 통해 뷰에 보내준다.
		model.addAttribute("main", service.getListBest(cvo));
		// service.getListDeadline(마감임박 더하기)를 main2이라는 이름을 통해 뷰에 보내준다.
		model.addAttribute("main2", service.getListDeadline(cvo));
		return "index.main";
	}

	/*
	 * @RequestMapping("/location")
	 * 
	 * @ResponseBody public String mainListLocation(Model model, ClubVO cvo,
	 * MemberVO mvo, HttpSession session) { log.info("mainlocation");
	 * 
	 * 
	 * session.setAttribute("memberLatitude", mvo.getMemberLatitude());
	 * session.setAttribute("memberLongitude", mvo.getMemberLongitude());
	 * 
	 * System.out.println("memberLatitude" + cvo.getMemberLatitude() +
	 * "memberLongitude" + cvo.getMemberLongitude());
	 * 
	 * // service.getListBest(인기더하기)를 main이라는 이름을 통해 뷰에 보내준다.
	 * model.addAttribute("main", service.getListBest(cvo)); //
	 * service.getListDeadline(마감임박 더하기)를 main2이라는 이름을 통해 뷰에 보내준다.
	 * model.addAttribute("main2", service.getListDeadline(cvo));
	 * 
	 * 
	 * return "redirect:main";
	 * 
	 * }
	 */
	/*
	 * // 검색결과 보여주기
	 * 
	 * @GetMapping("/searchlist.do") public void list(Criteria cri, Model model) {
	 * cri.setAmount(20);
	 * 
	 * model.addAttribute("cri", cri); log.info("searchlist(GET) - cri : " + cri);
	 * 
	 * model.addAttribute("list", service.getListSearch(cri.getKeyword()));
	 * log.info("searchlist(GET) - list : " +
	 * service.getListSearch(cri.getKeyword()));
	 * 
	 * }
	 */
}