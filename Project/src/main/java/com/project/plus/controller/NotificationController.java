package com.project.plus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.NotificationVO;
import com.project.plus.service.NotificationService;
import com.project.plus.utils.CalcTime;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NotificationController {
	@Autowired
	NotificationService notiService;
	
	// 알림 db에 저장 
	@RequestMapping("insertCommNoti")
	@ResponseBody
	public int insertCommNoti(NotificationVO noti) {
		return notiService.insertCommNoti(noti);
	}
	
	@RequestMapping("getNoti")
	public String getNoti(@RequestParam("mNum") int memberNum, Model model) {
		log.info("멤버번호 : " + memberNum + "의 알림 가져오기");
		
		List<NotificationVO> unreadList = notiService.getUnreadNoti(memberNum);
		List<NotificationVO> readList = notiService.getReadNoti(memberNum);
		CalcTime ct = new CalcTime();
		
		for(NotificationVO vo : unreadList) {
			// 시간 차이 구하기 
			String result = ct.calculateTime(notiService.getTimeDiff(vo.getNotId()));
			vo.setTimeDiff(result);
		}
		
		for(NotificationVO vo : readList) {
			// 시간 차이 구하기 
			String result = ct.calculateTime(notiService.getTimeDiff(vo.getNotId()));
			vo.setTimeDiff(result);
		}
		model.addAttribute("unreadList",unreadList);
		model.addAttribute("readList",readList);
		return "member/notification";
	}
	
	
	@RequestMapping("deleteNoti")
	@ResponseBody
	public int deleteNoti(NotificationVO noti) {
		int result = notiService.deleteNoti(noti);
		return result;
	}
	
	@RequestMapping("updateStatus")
	@ResponseBody
	public int updateStatus(NotificationVO noti) {
		int result = notiService.updateStatus(noti);
		return result;
	}
}
