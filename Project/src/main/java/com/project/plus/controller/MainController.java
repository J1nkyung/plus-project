package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.service.MainService;

import lombok.extern.log4j.Log4j;



@Controller
@Log4j
//@AllArgsConstructor
public class MainController {

	@Autowired
	private MainService service;

	@RequestMapping("/main")
	public String mainList(Model model, ClubVO vo) {
	log.info("main");
	
		// service.getListBest(인기더하기)를 main이라는 이름을 통해 뷰에 보내준다.
		model.addAttribute("main", service.getListBest(vo));
		// service.getListDeadline(마감임박 더하기)를 main2이라는 이름을 통해 뷰에 보내준다.
		model.addAttribute("main2", service.getListDeadline(vo));
		

		return "index.main";

	
	}

	
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