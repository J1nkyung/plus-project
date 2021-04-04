package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.ClubVO;
import com.project.plus.service.NormalService;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller()
@SessionAttributes("normal")

public class NormalController {

	@Autowired
	private NormalService service;

	@RequestMapping("normal.do")
	public String normalList(Model model, ClubVO vo) {
	log.info("normal");
	
		model.addAttribute("normal1", service.getListNormal(vo));
		model.addAttribute("normal2", service.getListNormalBest(vo));
		
		return "normalPlus.main";
		
	}
}