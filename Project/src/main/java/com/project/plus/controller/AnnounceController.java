package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.service.AnnounceService;

@Controller
@SessionAttributes("announce")
public class AnnounceController {
	
	@Autowired
	private AnnounceService as;
	
	@RequestMapping("/insertAnnounce.do")
	public String insertAnnounce(AnnounceVO vo) throws Exception {
		as.insertAnnounce(vo);	
		return "getAnnounceList.do";
	}
	
	@RequestMapping("/updateAnnounce.do")
	public String updateAnnounce(@ModelAttribute("announce") AnnounceVO vo) {
		System.out.println(vo);
		as.updateAnnounce(vo);
		return "getAnnounceList.do";
	}
	
	@RequestMapping("/deleteAnnounce.do")
	public String deleteAnnounce(AnnounceVO vo) {
		as.deleteAnnounce(vo);
		return "getAnnounceList.do";
	}
	
	@RequestMapping("/getAnnounce.do")
	public String getAnnounce(AnnounceVO vo, Model model) {
		model.addAttribute("announce", as.getAnnounce(vo));
		return "getAnnounce";
	}
	
	@RequestMapping("/announce.do")
	public String getAnnounceList(AnnounceVO vo, Model model) {
		
		model.addAttribute("announceList", as.getAnnounceList(vo));
		return "announce";
	}
}
