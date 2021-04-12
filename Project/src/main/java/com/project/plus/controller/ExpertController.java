package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.ExpertService;


import lombok.extern.log4j.Log4j;

@Log4j
@Controller()

public class ExpertController {

	@Autowired
	private ExpertService service;

	@GetMapping("/expert")
	public String expertList(Model model, ClubVO cvo, MemberVO mvo) {
	log.info("expert");
	
	// GPS 정보가 없으면 gps.jsp 가서 정보를 가져온다.
    if (mvo.getMemberLatitude() == null || mvo.getMemberLongitude() == null) {
       log.info("list(GET) - gps(GET)으로 forward ");
       String kind = "expert";
       return "redirect:main/gps?kind="+kind;
    }      
		model.addAttribute("expert1", service.getListExpert(mvo));
		model.addAttribute("expert2", service.getListExpertBest(mvo));
		
		return "main/expertPlus";
		
	}
	  
}
