package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.ChatVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.mapper.ChatMapper;
import com.project.plus.service.ChatService;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatMapper mapper;
	
	public List<ClubVO> getChatList(int memNum) {
		return mapper.getChatList(memNum);
	}
	@Override
	public List<ChatVO> getMessages(int clubNum) {
		return mapper.getMessages(clubNum);
	}
	public int insertMessage(ChatVO msg) {
		return mapper.insertMessage(msg);
	}
	@Override
	public Integer checkRoomId(int clubNum) {
		//count가 아니라 방 번호를 돌려줘야 함 ! 
		return mapper.checkRoomId(clubNum);
	}

	
}
