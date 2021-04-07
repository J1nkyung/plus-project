package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.ClubVO;
import com.project.plus.service.ExpertService;


import lombok.extern.log4j.Log4j;

@Log4j
@Controller()
@SessionAttributes("expert")

public class ExpertController {

	@Autowired
	private ExpertService service;

	@RequestMapping("expert.do")
	public String expertList(Model model, ClubVO vo) {
	log.info("expert");
	
		model.addAttribute("expert1", service.getListExpert(vo));
		model.addAttribute("expert2", service.getListExpertBest(vo));
		
		return "expertPlus.main";
		
	}
}
