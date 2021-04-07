package com.project.plus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.ChatVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.service.ChatService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	// 채팅방 목록 불러오기 
	@RequestMapping("/chat")
	public String getChatList(@RequestParam("memberNum") int memNum, Model model) {
		log.info("채팅 로그인 멤버 번호 : " + memNum);
		List<ClubVO> clubs = chatService.getChatList(memNum);
		model.addAttribute("clubs", clubs);
		return "club/chat";
	}
	
	// 클럽 넘버를 받아야 함 
	@RequestMapping("/getMessages")
	@ResponseBody
	public List<ChatVO> getMessages(@RequestParam("clubNum") int clubNum) {
		// vo 리턴하는거 
		log.info("채팅내역 불러오는 모임 번호 : " + clubNum);
		List<ChatVO> lists = chatService.getMessages(clubNum);
		return lists;
	}
	
	// 채팅 메시지 db 저장 
	@RequestMapping("/insertMessage")
	@ResponseBody
	public int insertMessage(ChatVO msg) {
		log.info("모임번호 : " + msg.getClubNum() + ", 멤버번호 : " + msg.getMemberNum() + ", 메시지 : " + msg.getChatMessage());
		return chatService.insertMessage(msg);
	}

}
