package com.project.plus.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PageMakerDTO;
import com.project.plus.domain.SearchCriteria;
import com.project.plus.mapper.TotalListMapper;
import com.project.plus.service.MainService;
import com.project.plus.service.TotalListService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TotalListController {

	@Autowired
	private TotalListService service;

	/* 게시판 목록 페이지 접속(페이징 적용) */
	@RequestMapping(value = "/totalList", method = RequestMethod.GET)
	public String totalList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		log.info("totalListGET");
	
		
		List<ClubVO> list = service.getListPaging(scri);
		model.addAttribute("list", list);

		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriteria(scri);
		pageMaker.setTotalCount(service.getTotal(scri));
		model.addAttribute("pageMaker", pageMaker);
		return "totalList";
	}
	

}

/*
 * @RequestMapping(value= "totalList.do", method = RequestMethod.GET) public
 * String list( Criteria cri, Model model) throws Exception {
 * 
 * log.info(cri.toString());
 * 
 * model.addAttribute("list", service.getBoardList(cri)); // 게시판의 글 리스트
 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
 * pageMaker.setTotalCount(service.getTotal(cri));
 * 
 * model.addAttribute("pageMaker", pageMaker); // 게시판 하단의 페이징 관련, 이전페이지, 페이지 링크
 * , 다음 페이지
 * 
 * return "totalList"; }
 */
