package com.project.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.ClubService;

@Controller
@SessionAttributes("calendar")
public class CalendarController {
	@Autowired
	private ClubService clubService;
	
	@RequestMapping("/getClubDate")
	public String getHeartList(ClubVO cvo, HttpSession session ,Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		cvo.setMemberNum(user.getMemberNum());
		model.addAttribute("clubList", clubService.selectClubDate(cvo));
		return "calendar.curClub";
	}
}
