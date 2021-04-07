package com.project.plus.controller;

import java.lang.reflect.Member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@AllArgsConstructor
public class MainController {

	@Autowired
	private MainService service;

	@RequestMapping("/main")
	public String mainList(Model model, ClubVO cvo, MemberVO mvo, HttpSession session) {
		log.info("main");
	  
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